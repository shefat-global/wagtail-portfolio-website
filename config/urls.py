# urls.py

from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import include, path

from wagtail.admin import urls as wagtailadmin_urls
from wagtail import urls as wagtail_urls
from wagtail.contrib.sitemaps.views import sitemap
from wagtail.documents import urls as wagtaildocs_urls

from search import views as search_views
from .api import api_router

urlpatterns = [
    path("django-admin/", admin.site.urls),

    # Wagtail admin + docs
    path("admin/", include(wagtailadmin_urls)),
    path("documents/", include(wagtaildocs_urls)),

    # Your routes
    path("search/", search_views.search, name="search"),
    path("api/v2/", api_router.urls),
    path("sitemap.xml", sitemap),

    # website.com/accounts/login/ -> allauth login view
    path('', include('allauth.urls')),
]

# Debug Toolbar must come BEFORE Wagtail's catch-all route
if settings.DEBUG:
    import debug_toolbar

    urlpatterns = [
        path("__debug__/", include(debug_toolbar.urls)),
    ] + urlpatterns

    # Serve static/media in dev
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# Wagtail catch-all must be LAST
urlpatterns += [
    path("", include(wagtail_urls)),
]