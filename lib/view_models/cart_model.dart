import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of item for shopping
  final List _shopItem = [
    // [itemName, itemPrice, imagePath, color]
    ["Apple", "2.40", "assets/images/apple.png", Colors.red],
    ["Banana", "1.90", "assets/images/banana.png", Colors.yellow],
    ["Cabbage", "0.90", "assets/images/cabbage.png", Colors.green],
    ["Carrot", "1.00", "assets/images/carrot.png", Colors.deepOrange],
    ["Chicken", "9.40", "assets/images/chicken.png", Colors.brown],
    ["Coffee", "3.90", "assets/images/coffee.png", Colors.brown],
    ["Cookies", "2.50", "assets/images/cookies.png", Colors.brown],
    ["Onion", "1.35", "assets/images/onion.png", Colors.purple],
    ["Water", "0.40", "assets/images/water.png", Colors.blue],
    ["Watermelon", "3.40", "assets/images/watermelon.png", Colors.red]
  ];

  // this getter is created for _shopItem to get all items
  get shopItem => _shopItem;

  // List of cart item
  final List _cartItems = [];

  //create it getter to get value
  get cartItem => _cartItems;

// add items to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItem[index]);
    notifyListeners();
  }

// remove items to cart
  void removeItemToCart(int index) {
    _cartItems.remove(_cartItems[index]);
    notifyListeners();
  }
//calculate total price

  String calculatePrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
