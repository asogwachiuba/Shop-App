import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class ItemsOnSale extends ChangeNotifier {
  List<Items> search_list = [];
  bool has_calculated = false;
  List<int?> list_of_current_prices = [];
  int sum_of_current_prices = 0;
  // list for the favorite screen
  List<Items> favorite_list = [];
  // list for the my cart list screen
  List<Items> my_cart_list = [];
  List<Items> _selected_offer_category = [];
  List<Items> get selected_offer_category => _selected_offer_category;
  // list for special offers
  List<Items>special_offers = [
    Items(name: 'Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Sports', name_of_list: 'Special Offer List',),
    Items(name: 'Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Sports', name_of_list: 'Special Offer List',),
    Items(name: 'Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Sports',name_of_list: 'Special Offer List',),
    Items(name: 'Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Sports',name_of_list: 'Special Offer List',),
    Items(name: 'Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Sports',name_of_list: 'Special Offer List',),
  ];

  // list for all available offers
  List<Items>offers = [
    Items(name: ' Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Sports', name_of_list: 'Available Offer List',),
    Items(name: ' Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Sports', name_of_list: 'Available Offer List',),
    Items(name: ' Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: ' Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: ' Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: '💅🏿 Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Cosmetics', name_of_list: 'Available Offer List',),
    Items(name: '💅🏿 Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Cosmetics', name_of_list: 'Available Offer List',),
    Items(name: '💅🏿 Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Cosmetics',name_of_list: 'Available Offer List',),
    Items(name: '💅🏿 Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Cosmetics',name_of_list: 'Available Offer List',),
    Items(name: '💅🏿 Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Cosmetics',name_of_list: 'Available Offer List',),
    Items(name: '📚 Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Books', name_of_list: 'Available Offer List',),
    Items(name: '📚 Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Books', name_of_list: 'Available Offer List',),
    Items(name: '📚 Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Books',name_of_list: 'Available Offer List',),
    Items(name: '📚 Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Books',name_of_list: 'Available Offer List',),
    Items(name: '📚 Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Books',name_of_list: 'Available Offer List',),
    Items(name: '🤖 Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Home Electronics', name_of_list: 'Available Offer List',),
    Items(name: '🤖 Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Home Electronics', name_of_list: 'Available Offer List',),
    Items(name: '🤖 Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Home Electronics',name_of_list: 'Available Offer List',),
    Items(name: '🤖 Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Home Electronics',name_of_list: 'Available Offer List',),
    Items(name: '🤖 Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Home Electronics',name_of_list: 'Available Offer List',),
    Items(name: '👞🩰 Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Shoes', name_of_list: 'Available Offer List',),
    Items(name: '👞🩰 Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Shoes', name_of_list: 'Available Offer List',),
    Items(name: '👞🩰 Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Shoes',name_of_list: 'Available Offer List',),
    Items(name: '👞🩰 Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Shoes',name_of_list: 'Available Offer List',),
    Items(name: '👞🩰 Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Shoes',name_of_list: 'Available Offer List',),
    Items(name: '👗👖 Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Clothing', name_of_list: 'Available Offer List',),
    Items(name: '👗👖 Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Clothing', name_of_list: 'Available Offer List',),
    Items(name: '👗👖 Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Clothing',name_of_list: 'Available Offer List',),
    Items(name: '👗👖 Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Clothing',name_of_list: 'Available Offer List',),
    Items(name: '👗👖 Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Clothing',name_of_list: 'Available Offer List',),
    Items(name: '💎 Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Accessories', name_of_list: 'Available Offer List',),
    Items(name: '💎 Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: 2000,category: 'Accessories', name_of_list: 'Available Offer List',),
    Items(name: '💎 Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: 8900,category: 'Accessories',name_of_list: 'Available Offer List',),
    Items(name: '💎 Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: 16099,category: 'Accessories',name_of_list: 'Available Offer List',),
    Items(name: '💎 Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: 12300,category: 'Accessories',name_of_list: 'Available Offer List',),
  ];

  // function to update item favorite property
     void favoriteChangedFromAvailableOffers(Items item) {
       offers[offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
       notifyListeners();
     }

  void favoriteChangedFromSpecialOffers(item) {
    special_offers[special_offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
    notifyListeners();
  }
     // function to update favorite list
     void updateFavoriteList(Items item){
    if(item.favorite == true) {
      favorite_list.add(item);
    }
    else favorite_list.remove(item);
    notifyListeners();
     }
    // function to update cart list
     void addToCart(Items item) {
      bool alreadyExists = my_cart_list.contains(item) ;
      if(alreadyExists ==true) {}
      else my_cart_list.add(item);
      notifyListeners();
       }
  // function to remove item from favorite list
       void removeFromFavoriteList(Items item) {
       bool ItemExists  = favorite_list.contains(item);
       if(ItemExists == true && item.name_of_list == 'Special Offer List') {
         favorite_list.remove(item);
         special_offers[special_offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
       }
       if(ItemExists == true && item.name_of_list == 'Available Offer List') {
         favorite_list.remove(item);
         offers[offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
       }
       notifyListeners();
       }

       void removeFromCart(Items item) {
         bool ItemExists  = my_cart_list.contains(item);
         if(ItemExists == true && item.name_of_list == 'Special Offer List') {
           my_cart_list.remove(item);
         }
         if(ItemExists == true && item.name_of_list == 'Available Offer List') {
           my_cart_list.remove(item);
         }
         notifyListeners();
       }

       void ReturnSelectedList(String _category) {
       if (_category == 'All') {
         _selected_offer_category.removeRange(0,_selected_offer_category.length);
         _selected_offer_category.addAll(offers);
       } else { _selected_offer_category.removeRange(0,_selected_offer_category.length);
       selected_offer_category.addAll(offers.where((element) => element.category == _category).toList());
       }
       notifyListeners();
       }

       void ReturnSearchList(String _value) {
         search_list = offers.where((element) => element.name!.toLowerCase().contains(_value.toLowerCase())).toList();
         notifyListeners();
       }
       List<String> nameOfSearchListItem = [];
       void GetNameOfSearchListItem() {
         nameOfSearchListItem.removeRange(0, nameOfSearchListItem.length);
         search_list.forEach((element) {nameOfSearchListItem.add(element.name.toString());});
         notifyListeners();
       }

     }


class Items{
  String? name;
  String? image;
  int? numbers_in_stock;
  int? price;
  String? category;
  bool favorite = false;
  String? name_of_list;

  Items({required this.name, required this.image,
    required this.numbers_in_stock, required this.price, required this.category, required this.name_of_list});
}