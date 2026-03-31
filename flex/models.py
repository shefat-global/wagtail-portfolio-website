"""flexible page."""
from django.db import models
from wagtail.models import Page
from wagtail.admin.panels import FieldPanel
from wagtail.fields import StreamField  
from wagtail import blocks as streamfield_blocks

from streams import blocks


# Create your models here.

class FlexPage(Page):
    """Flexible page class."""

    template = "flex/flex_page.html"

    subpage_types = ['flex.FlexPage', 'contact.ContactPage']
    parent_page_types  = ['flex.FlexPage', 'home.HomePage']

    content = StreamField(
        [            
            ("title_and_text", blocks.TitileAndTextBlock()),  
            ("full_richtext", blocks.RichtextBlock()), 
            ("simple_richtext", blocks.SimpleRichtextBlock()),  
            ("cards", blocks.CardBlock()),
            ("cta", blocks.CTABlock()), 
            ("button", blocks.ButtonBlock()), 
            ("char_block", streamfield_blocks.CharBlock(
                required=False,
                help_text="Add a char block",
                min_length=10,
                max_length=100,
                template="streams/char_block.html",
            )),              
        ],
        null=True,
        blank=True,
    )

    subtitle = models.CharField(max_length=100, null=True, blank=True)

    content_panels = Page.content_panels + [
        FieldPanel("subtitle"),
        FieldPanel("content")
    ]

    class Meta: 
        verbose_name = "Flex Page"
        verbose_name_plural = "Flex Pages"