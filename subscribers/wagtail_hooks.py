from wagtail import hooks
from .admin import subscriber_viewset

@hooks.register("register_admin_viewset")
def register_subscribers_viewset():
    return subscriber_viewset