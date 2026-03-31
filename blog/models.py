"""Blog listing and blog detail pages."""
from django.db import models
from django.core.cache import cache
from django.core.cache.utils import make_template_fragment_key
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from wagtail.models import Page, Orderable
from modelcluster.fields import ParentalKey, ParentalManyToManyField
from wagtail.admin.panels import FieldPanel, MultiFieldPanel, InlinePanel
from wagtail.fields import StreamField  
from streams import blocks
from django.shortcuts import render
from wagtail.contrib.routable_page.models import RoutablePageMixin, route
from wagtail.snippets.models import register_snippet
from django import forms
from wagtail.api import APIField
from rest_framework.fields import Field
from wagtail.images.api.fields import ImageRenditionField
from modelcluster.contrib.taggit import ClusterTaggableManager
from taggit.models import TaggedItemBase
from django.http import Http404
from django.shortcuts import render
from rest_framework import serializers


# Create your models here.

class ImageSerializedField(Field):

    def to_representation(self, value):
        return {
            "url": value.file.url,
            "title": value.title,
            "width": value.width,
            "height": value.height,
        }


class BlogAuthorOrderable(Orderable):
    """This allows us to select one or more blog authors from snippet"""

    page = ParentalKey("blog.BlogDetailPage", related_name="blog_authors",)

    author = models.ForeignKey(
        "blog.BlogAuthor",
        on_delete=models.CASCADE,
    )

    panels = [
        FieldPanel("author")
    ]

    @property
    def author_name(self):
        return self.author.name
    
    @property
    def author_image(self):
        return self.author.image
    
    @property
    def author_website(self):
        return self.author.website
    
    api_fields = [
        APIField("author"),
        APIField("author_name"),
        # APIField("author_image", serializer=ImageSerializedField()),
        APIField("image", serializer=ImageRenditionField("fill-200x250", source="author_image")),
        APIField("author_website"), 
    ]



class BlogAuthor(models.Model):
    """Blog author for snippets"""

    name = models.CharField(max_length=100)
    website = models.URLField(blank=True, null=True)
    image = models.ForeignKey(
            "wagtailimages.Image",
            on_delete=models.SET_NULL,
            null=True,
            blank=True,
            related_name="+",
        )
    
    panels = [
        MultiFieldPanel(
            [
                FieldPanel("name"),
                FieldPanel("image"), 
            ],
            heading = "Name and Image",   
        ),
        MultiFieldPanel(
            [
                FieldPanel("website"),
            ],
            heading = "Links"
        ),
    ]



    def __str__(self):
        """String repr of this class."""
        return self.name
    

    class Meta:
        verbose_name = "Blog Author"
        verbose_name_plural = "Blog Authors"

register_snippet(BlogAuthor)



class BlogCategory(models.Model):
    """Blog Category for a snippet"""

    name = models.CharField(max_length=255)
    slug = models.SlugField(
        verbose_name="slug",
        allow_unicode=True,
        max_length=255,
        help_text='A Slug to identify post by this category '
    )

    panels = [
        FieldPanel("name"),
        FieldPanel("slug"),
    ]

    class Meta:
        verbose_name = "Blog Category"
        verbose_name_plural = "Blog Categories"
        ordering = ["name"]

    def __str__(self):
        return self.name

register_snippet(BlogCategory)



class BlogChildPagesSerializer(serializers.ModelSerializer):
    def to_representation(self, child_pages):
        return_posts = []

        for child in child_pages: 
            post_dict = {
                "id": child.id,
                "title": child.title,
                "url": child.url,
            }
            return_posts.append(post_dict)
        return return_posts
    
    #  return [
    #      {
    #         'id': child.id,
    #         'title': child.title,
    #         'url': child.url,
    #         'slug' : child.slug,
    #      } for child in child_pages
    #  ]


class BlogListingPage(RoutablePageMixin, Page):
    """Listing page lists all the blog detail pages."""

    template = "blog/blog_listing_page.html"
    ajax_template = "blog/blog_listing_page_ajax.html"
    max_count = 1
    sub_page_types = [
        'blog.VideoBlogPage',
        'blog.ArticleBlogPage',        
    ]

    custom_title = models.CharField(
        max_length=100,
        blank=False,
        null=False,
        help_text="Overwrites the default title",
    )

    content_panels = Page.content_panels + [
        FieldPanel("custom_title"),      
    ]


    api_fields = [
        APIField("custom_title"),
        APIField("posts", serializer=BlogChildPagesSerializer(source="get_child_pages")),
    ]

    @property
    def get_child_pages(self):
        return self.get_children().public().live()
       # return self.get_children().public().live().values("id", "title", "url", "slug")



    def get_context(self, request, *args, **kwargs):
        """Adding custom stuff to our context."""
        context = super().get_context(request, *args, **kwargs)
        # context["posts"] = BlogDetailPage.objects.live().public()
        all_posts = BlogDetailPage.objects.live().public().order_by('-first_published_at')

        if request.GET.get('tag', None): 
            tags = request.GET.get('tag')
            all_posts = all_posts.filter(tags__slug__in=[tags]) 

        paginator = Paginator(all_posts, 2) # @todo change to 5 per page

        page = request.GET.get('page')
        try:
            posts = paginator.page(page)
        except PageNotAnInteger:
            posts = paginator.page(1)
        except EmptyPage: 
            posts = paginator.page(paginator.num_pages)
        
        context['posts'] = posts

        context["categories"] = BlogCategory.objects.all()
        # context["a_special_link"] = self.reverse_subpage('latest_posts')
        return context
    
    @route(r"^july-2019/$", name="july_2019") 
    @route(r"^year/(\d+)/(\d+)/$", name="blogs_by_year")
    def blogs_by_year(self, request, year=None, month=None):
        context = self.get_context(request)
        print(year)
        print(year)
        print(year)
        return render(request, "blog/latest_posts.html", context)

        
    # /blog/category/
    @route(r'^category/(?P<cat_slug>[-\w]+)/$', name='category_view')
    def category_view(self, request, cat_slug, *args, **kwargs):
        """Find blog posts based on a category"""
        context = self.get_context(request)

        try: 
            category = BlogCategory.objects.get(slug=cat_slug)
        except Exception as e: 
            category = None
        
        if category is None: 
            # Redirect the user to /blog/
            pass       

        context["posts"] = BlogDetailPage.objects.live().public().filter(categories__slug=cat_slug)
        return render(request, "blog/latest_posts.html", context)



    
    @route(r'^latest/$', name="latest_posts")
    def latest_blog_posts_only_shows_last_5(self, request, *args, **kwargs):
        context = self.get_context(request, *args, **kwargs)
        context["latest_posts"] = BlogDetailPage.objects.live().public()[:1]
        context["authors"] = BlogAuthor.objects.all()
        context["name"] = "Shefat"
        return render(request, "blog/latest_posts.html", context)
    
    def get_sitemap_urls(self, request):
        # uncomment to have no sitemap for this page 
        # return []
        sitemap = super().get_sitemap_urls(request)
        sitemap.append(
            {
                "location" : self.full_url+self.reverse_subpage("latest_posts"),
                "lastmod" : (self.last_published_at or self.latest_revision_created_at),
                "priority" : 0.9,
            }
        )
        return sitemap


class BlogPageTags(TaggedItemBase):
    content_object = ParentalKey(
        'BlogDetailPage',
        related_name='tagged_items',
        on_delete=models.CASCADE,
    )


class BlogDetailPage(Page):
    """Parental Blog detail page."""

    subpage_types = []
    parent_page_types = ['blog.BlogListingPage']
    tags= ClusterTaggableManager(through=BlogPageTags, blank=True)

    custom_title = models.CharField(
        max_length=100,
        blank=False,
        null=False,
        help_text="Overwrites the default title",
    )
    banner_image = models.ForeignKey(
        "wagtailimages.Image",
        blank=True,
        null=True,
        related_name="+",
        on_delete=models.SET_NULL
    )

    categories = ParentalManyToManyField("blog.BlogCategory", blank=True)


    content = StreamField(
        [            
            ("title_and_text", blocks.TitileAndTextBlock()),  
            ("full_richtext", blocks.RichtextBlock()), 
            ("simple_richtext", blocks.SimpleRichtextBlock()),  
            ("cards", blocks.CardBlock()),
            ("cta", blocks.CTABlock()),            
        ],
        null=True,
        blank=True,
    )

    content_panels = Page.content_panels + [
        FieldPanel("custom_title"),
        FieldPanel("tags"),
        FieldPanel("banner_image"),
        MultiFieldPanel(
            [
                InlinePanel("blog_authors", label="Authors", min_num=1, max_num=4)
            ],
            heading="Author(s)"
        ),
        MultiFieldPanel(
            [
                FieldPanel("categories", widget=forms.CheckboxSelectMultiple)
            ],
            heading="Categories"
        ),
        FieldPanel("content"),
    ]

    api_fields = [
        APIField("blog_authors"),
        APIField("categories"),
        APIField("content"),        
    ]

    def save(self, *args, **kwargs):
        """Clear cache"""
        print("Clearing cache for blog post preview") 
        key = make_template_fragment_key("post_post_preview", [self.id])
        cache.delete(key)
    
        # key = make_template_fragment_key("navigation")
        # cache.delete(key)

        return super().save(*args, **kwargs)



# First subclassed blog post page 
class ArticleBlogPage(BlogDetailPage):
    """A subclassed blog post page for articles"""

    template = "blog/article_blog_page.html"


    subtitle = models.CharField(
        max_length=100, 
        blank=True, 
        null=True
        )
    intro_image = models.ForeignKey(
            "wagtailimages.Image",
            blank=True,
            null=True,
            on_delete=models.SET_NULL,
            help_text="Best Size for this image will be 1400x400"
        )
        
    content_panels = Page.content_panels + [
        FieldPanel("custom_title"),
        FieldPanel("subtitle"),
        FieldPanel("tags"),
        FieldPanel("banner_image"),                                    
        FieldPanel("intro_image"),
        MultiFieldPanel(
            [
                InlinePanel("blog_authors", label="Authors", min_num=1, max_num=4)
            ],
            heading="Author(s)"
        ),
        MultiFieldPanel(
            [
                FieldPanel("categories", widget=forms.CheckboxSelectMultiple)
            ],
            heading="Categories"
        ),
        FieldPanel("content"),
    ]
    


# Second subclassed page 
class VideoBlogPage(BlogDetailPage):
    """A video subclassed page."""

    template = "blog/video_blog_page.html"

    youtube_video_id = models.CharField(max_length=30, blank=True)    
          
    content_panels = Page.content_panels + [
        FieldPanel("custom_title"),
        FieldPanel("tags"),
        FieldPanel("banner_image"),    
        MultiFieldPanel(
            [
                InlinePanel("blog_authors", label="Authors", min_num=1, max_num=4)
            ],
            heading="Author(s)"
        ),
        MultiFieldPanel(
            [
                FieldPanel("categories", widget=forms.CheckboxSelectMultiple)
            ],
            heading="Categories"
        ),
        FieldPanel("youtube_video_id"),                             
        FieldPanel("content"),
    ]

    