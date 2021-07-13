import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/models/products.dart';

const List<Product> stadia_products = [
  Product(
    price: 129,
    id: 101,
    name: "STADIA - Wasabi",
    imagePath: product_game_controller_wasabi,
    optionColor: [Colors.black, Colors.white, Colors.orange],
    learnMore: "https://store.google.com/us/product/pixel_5?hl=en-US",
    description: fakeDescription,
  ),
  Product(
    price: 129,
    id: 102,
    name: "STADIA - White",
    imagePath: product_game_controller,
    optionColor: [Colors.black, Colors.white, Colors.orange],
    learnMore: "https://store.google.com/us/product/pixel_5?hl=en-US",
    description: fakeDescription,
  ),
  Product(
    price: 129,
    id: 103,
    name: "STADIA - Founder Edition",
    imagePath: product_game_controller_founder_edition,
    optionColor: [Colors.black, Colors.white, Colors.orange],
    learnMore: "https://store.google.com/us/product/pixel_5?hl=en-US",
    description: fakeDescription,
  ),
  Product(
    price: 129,
    id: 104,
    name: "STADIA - Black",
    imagePath: product_game_controller_black,
    optionColor: [Colors.black, Colors.white, Colors.orange],
    learnMore: "https://store.google.com/us/product/pixel_5?hl=en-US",
    description: fakeDescription,
  ),
  Product(
    price: 129,
    id: 105,
    name: "Google Cast Ultra",
    imagePath: product_goole_cast,
    optionColor: [Colors.black, Colors.white, Colors.orange],
    learnMore: "https://store.google.com/us/product/pixel_5?hl=en-US",
    description: fakeDescription,
  ),
];
