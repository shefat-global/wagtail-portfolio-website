from django.db import models

# Create your models here.
class Subscriber(models.Model):
    """A subscriber model."""

    email = models.CharField(max_length=100, blank=False, null= False, help_text="Email Address")
    full_name= models.CharField(max_length=100, blank=False, null=False, help_text="First Name and Last Name")

    def __str__(self):
        """Str repr of this object."""
        return self.full_name