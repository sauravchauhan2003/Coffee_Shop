import 'package:coffeeshop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list
  final List<Coffee> _shop = [
    //black coffee
    Coffee(name: 'Black Coffee', price: '150'),

    //latte
    Coffee(name: 'Latte', price: '220'),

    //espresso
    Coffee(name: 'Espresso', price: '300'),

    //iced coffee
    Coffee(name: 'Iced Coffee', price: '250')
  ];

  //user cart
  List<Coffee> _usercart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get usercart => _usercart;
  //add item to cart
  void additemtocart(Coffee coffee) {
    _usercart.add(coffee);
    notifyListeners();
  }

  //remove item from the cart
  void removeitemfromcart(Coffee coffee) {
    _usercart.remove(coffee);
    notifyListeners();
  }
}
