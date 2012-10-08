from django.db import models

from django.contrib.auth.models import User

class Player(models.Model):
  user = models.ForeignKey(User)
  position = models.CharField(max_length=256)
  phone = models.CharField(max_length=16)
