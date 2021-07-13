import 'package:flutter/material.dart';
import 'package:stadia_app/models/stadia_shop.dart';
import 'package:stadia_app/widgets/store_page/shop_stadia_item.dart';

class ShopStadiaWidget extends StatelessWidget {
  const ShopStadiaWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      for (StadiaProduct item in stadia_products)
        ShopStatiaItem(
          stadiaProduct: item,
        )
    ]));
  }
}
