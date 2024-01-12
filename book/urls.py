from django.urls import path
from . import views


urlpatterns = [
    path("books", views.retrieveInfoForAllBooks),
    path("books/<pk>", views.retrieveSingleBook),
    path("book/search-by-book", views.searchForBookByName),
    path("book/update-quantity", views.updateBookQuantity)
]