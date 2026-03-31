
from django.db import models
from django.shortcuts import render
from modelcluster.fields import ParentalKey
from wagtail.api import APIField
from wagtail.models import Page, Orderable
from wagtail.admin.panels import ( 
    FieldPanel, 
    InlinePanel, 
    MultiFieldPanel, 
    ObjectList, 
    TabbedInterface 
)
from wagtail.fields import RichTextField 
from wagtail.fields import StreamField  
from wagtail.contrib.routable_page.models import (
    RoutablePageMixin, route
)
from rest_framework.fields import Field
from streams import blocks
from rest_framework import serializers
from wagtail.models import Page



class HomePageCarouselImages(Orderable):
    """Between 1 and 5 images for the home page carousel."""
    
    page = ParentalKey("home.HomePage", related_name="carousel_images")
    carousel_image = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )  

    panels = [
        FieldPanel("carousel_image")
    ]

    api_fields = [
        APIField("carousel_image"),  
    ]
     


class BannerCTASerializer(serializers.ModelSerializer):
    url = serializers.CharField(read_only=True)
    owner = serializers.SerializerMethodField()

    class Meta:
        model = Page
        fields = ["id", "title", "first_published_at", "url", "owner"]

    def get_owner(self, obj):
        return obj.owner.username if obj.owner else None


class HomePage(RoutablePageMixin, Page):    

    """Home page model"""

    template = "home/home.html"
    subpage_types = [
        'blog.BlogListingPage',
        'contact.ContactPage',
        'flex.FlexPage',
    ]

    parent_page_types = [
        'wagtailcore.Page'
    ]
    
   # max_count = 1

    banner_title = models.CharField(
        max_length=100, 
        blank=True, 
        null=True
        )
    banner_subtitle = RichTextField(
        features=["bold", "italic"],
        blank=True,
        default="Banner Sub Title",
    )
    banner_image = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )  
    banner_cta = models.ForeignKey(
        "wagtailcore.Page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )      
    content = StreamField(
        [    
            ("cta", blocks.CTABlock()),            
        ],
        null=True,
        blank=True,
    )


    api_fields = [
        APIField("banner_title"), 
        APIField("banner_subtitle"),
        APIField("banner_image"),
        APIField("banner_cta", serializer=BannerCTASerializer()),
        APIField("carousel_images"),  
        APIField("content"), 
        APIField("a_custom_api_response")
    ]

    @property 
    def a_custom_api_response(self):
       # return "Something custom"
       return f"Banner title is: {self.banner_title}"

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel("banner_title"),
            FieldPanel("banner_subtitle"),
            FieldPanel("banner_image"),
       
        ], heading="Banner Options"),
      
        MultiFieldPanel([
            InlinePanel("carousel_images", min_num=1, max_num=5, label="Image"),
        ], heading="Carousel Images"),
        FieldPanel("content"),
    ]

    sidebar_panels = [
        MultiFieldPanel([
            FieldPanel("banner_cta"),
        ], heading="Sidebar Options")
    ]


    # promote_panels = []  

    edit_handler = TabbedInterface([
        ObjectList(content_panels, heading='Content'),
        ObjectList(Page.promote_panels, heading="Promote Staff"),  
        ObjectList(sidebar_panels, heading="Banner Settings"),    
    ]) 


    class Meta:
         verbose_name = "Home Page"
         verbose_name_plural = "Plural Name"

    @route(r'^subscribe/$')
    def the_subscribe_page(self, request, *args, **kwargs):
        context = self.get_context(request, *args, **kwargs)
        context["a_special_test"] = "Hello world 121313"
        return render(request, "home/subscribe.html", context)
    
    def get_admin_display_title(self):
        return "Data Ceil Home Page"

HomePage._meta.get_field("title").verbose_name = "To any verbose name"
HomePage._meta.get_field("title").help_text = None

