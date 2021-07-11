import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/models/stadia_shop.dart';

class ShopStatiaItem extends StatelessWidget {
  final StadiaProduct stadiaProduct;
  const ShopStatiaItem({
    Key key,
    @required this.stadiaProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(30),
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              stadiaProduct.imagePath,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stadiaProduct.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${stadiaProduct.price}.00",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).hintColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "ADD",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Icon(
                        Icons.bookmark_border,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
