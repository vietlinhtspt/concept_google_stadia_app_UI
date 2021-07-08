import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';

class Product {
  final int width, height, price, id;
  final String imagePath, title, subTitle, name, description, learnMore;
  final Color backgroundColor;
  final List<Color> optionColor;
  final bool isTitleOnLeft, isCheckout;

  const Product(
      {this.width,
      this.height,
      this.price,
      this.id,
      this.imagePath,
      this.title,
      this.subTitle,
      this.name,
      this.description,
      this.backgroundColor,
      this.optionColor,
      this.learnMore,
      this.isCheckout,
      this.isTitleOnLeft = false});
}

const String fakeDescription =
    "Stadia is Google’s gaming platform that lets you instantly play video games on compatible screens you already own. Stream games directly to your favorite compatible devices.";
const double opacity = 1;
const List<Product> products = [
  Product(
      width: 2,
      height: 1,
      price: 799,
      id: 7,
      imagePath: product_pixel_phone,
      title: "Meet the \nGoogle Pixel 4/4XL",
      name: "Google Pixel 4/4XL",
      learnMore: "https://store.google.com/us/product/pixel_5?hl=en-US",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(200, 212, 232, opacity),
      optionColor: [Colors.black, Colors.white, Colors.orange],
      isTitleOnLeft: true),
  Product(
      width: 1,
      height: 1,
      price: 299,
      id: 1,
      imagePath: product_day_dream,
      name: "DayDream View",
      subTitle: "Premium",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(183, 225, 237, opacity),
      optionColor: [Colors.black, Colors.white]),
  Product(
      width: 1,
      height: 1,
      price: 299,
      id: 3,
      imagePath: product_google_home_hub,
      name: "Google Home Hub",
      subTitle: "New release",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(225, 232, 200, opacity),
      optionColor: [
        Colors.black,
        Colors.white,
        Colors.grey,
        Colors.pinkAccent
      ]),
  Product(
      width: 2,
      height: 1,
      price: 299,
      id: 2,
      imagePath: prodcut_game_controller_cast,
      title: "Google \nStadia",
      name: "Google Stadia",
      subTitle: "New Release",
      isCheckout: true,
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(232, 200, 200, opacity),
      optionColor: [Colors.black, Colors.white],
      isTitleOnLeft: false),
  Product(
      width: 1,
      height: 1,
      price: 49,
      id: 4,
      imagePath: product_google_home_mini,
      name: "Google Home Mini",
      subTitle: "Must have",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(200, 223, 232, opacity),
      optionColor: [Colors.black, Colors.white]),
  Product(
      width: 1,
      height: 1,
      price: 99,
      id: 5,
      imagePath: product_google_home,
      name: "Google Home",
      subTitle: "Best Value Google Speaker",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(232, 229, 200, opacity),
      optionColor: [Colors.black, Colors.white]),
  Product(
      width: 1,
      height: 1,
      price: 199,
      id: 6,
      imagePath: product_pixel_buds,
      name: "Google Pixel Buds",
      subTitle: "Must have",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(232, 213, 200, opacity),
      optionColor: [Colors.black, Colors.white]),
  Product(
      width: 2,
      height: 1,
      price: 49,
      id: 8,
      imagePath: product_pixel_stand,
      name: "Google Pixel Stand",
      subTitle: "New Release",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(210, 200, 232, opacity),
      optionColor: [Colors.black, Colors.white]),
  Product(
      width: 1,
      height: 1,
      price: 299,
      id: 9,
      imagePath: product_game_controller,
      name: "Google Stadia",
      subTitle: "Premium",
      description: fakeDescription,
      backgroundColor: Color.fromRGBO(232, 200, 200, opacity),
      optionColor: [Colors.black, Colors.white]),
];
