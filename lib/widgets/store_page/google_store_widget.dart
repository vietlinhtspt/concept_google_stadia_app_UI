import 'package:flutter/material.dart';
import 'package:stadia_app/models/products.dart';
import 'package:stadia_app/pages/item_detal_page.dart';
import 'package:stadia_app/widgets/store_page/store_icon_widget.dart';

class ShopGoogleWidget extends StatelessWidget {
  const ShopGoogleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: renderStoreWidget(context, products)),
    );
  }

  List<Widget> renderStoreWidget(BuildContext context, List<Product> products) {
    final double width = MediaQuery.of(context).size.width;
    List<Widget> widgetsOutput = [];
    for (var index = 0; index < products.length; index++) {
      // Render a single item in a row
      // print(products[index].title);
      if (products[index].width == 2) {
        widgetsOutput.add(InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ItemDetalPage(product: products[index])));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(color: products[index].backgroundColor),
            child: Row(children: renderItemStore(context, products[index])),
          ),
        ));
      }
      // Render two items in a row
      else {
        if (index + 1 < products.length) {
          widgetsOutput.add(renderTwoItemToColumn(
              context, products[index], products[index + 1], width));
          index = index + 1;
        } else {
          renderOneItemSmall(context, products[index], width);
        }
      }
    }
    print(widgetsOutput);
    return widgetsOutput;
  }

  Widget renderTwoItemToColumn(
      BuildContext context, Product product1, Product product2, double width) {
    return Row(
      children: [
        renderOneItemSmall(context, product1, width / 2),
        renderOneItemSmall(context, product2, width / 2),
      ],
    );
  }

  Widget renderOneItemSmall(
      BuildContext context, Product product, double width) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetalPage(product: product)));
      },
      child: Container(
        width: width,
        // height: 80,
        color: product.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Hero(
                tag: product.id,
                child: Image.asset(
                  product.imagePath,
                  height: 90,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 18),
              child: Text(
                product.subTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> renderItemStore(BuildContext context, Product product) {
    List<Widget> widgetsOutput = [];
    widgetsOutput.add(Hero(
      tag: product.id,
      child: Image.asset(
        product.imagePath,
        height: MediaQuery.of(context).size.height / 8,
      ),
    ));

    widgetsOutput.insert(
        product.isTitleOnLeft ? 0 : 1,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: product.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold))
              ])),
              if (product.subTitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Text(
                    product.subTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                )
              else
                SizedBox(),
              product.isCheckout == true
                  ? StoreButtonWidget(title: "CHECK OUT")
                  : product.learnMore != null
                      ? StoreButtonWidget(title: "Learn more")
                      : SizedBox(
                          width: 10,
                        )
            ],
          ),
        ));
    return widgetsOutput;
  }
}
