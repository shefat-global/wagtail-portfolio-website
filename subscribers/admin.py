from wagtail.admin.viewsets.model import ModelViewSet

from .models import Subscriber

class SubscriberAdmin(ModelViewSet):
    """Subscriber Admin."""

    model = Subscriber

    icon = "mail" 

    # Sidebar menu
    menu_label = "Subscribers"
    menu_icon = "placeholder"
    menu_order = 290
    add_to_admin_menu = True
    add_to_settings_menu = False

    # Listing config
    list_display = ("email", "full_name")
    search_fields = ("email", "full_name")

    form_fields = ("email", "full_name")


subscriber_viewset = SubscriberAdmin("subscribers")  