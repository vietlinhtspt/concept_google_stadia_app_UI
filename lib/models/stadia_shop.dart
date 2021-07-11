import 'package:stadia_app/constants/image_assert.dart';

class StadiaProduct {
  final String name, imagePath;
  final int price;

  const StadiaProduct({this.name, this.imagePath, this.price});
}

const List<StadiaProduct> stadia_products = [
  StadiaProduct(
      name: "STADIA - Wasabi",
      imagePath: product_game_controller_wasabi,
      price: 129),
  StadiaProduct(
      name: "STADIA - White",
      imagePath: product_game_controller_black,
      price: 129),
  StadiaProduct(
      name: "STADIA - Founder Edition",
      imagePath: product_game_controller_founder_edition,
      price: 159),
  StadiaProduct(
      name: "STADIA - Black",
      imagePath: product_game_controller_black,
      price: 129),
  StadiaProduct(
      name: "Google Cast Ultra", imagePath: product_goole_cast, price: 129)
];
