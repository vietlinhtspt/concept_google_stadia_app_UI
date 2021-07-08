import 'package:flutter/material.dart';
import 'package:stadia_app/models/products.dart';
import 'package:stadia_app/theme/colors.dart';
import 'package:stadia_app/widgets/item_details/item_detail_app_bar.dart';

class ItemDetalPage extends StatefulWidget {
  final Product product;

  const ItemDetalPage({Key key, this.product}) : super(key: key);

  @override
  _ItemDetalPageState createState() => _ItemDetalPageState();
}

class _ItemDetalPageState extends State<ItemDetalPage> {
  Color isSelectedColor;
  int select = 0;
  @override
  Widget build(BuildContext context) {
    isSelectedColor = widget.product.optionColor[0];
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Theme.of(context).textTheme.bodyText1.color,
        //       size: 30,
        //     ),
        //   ),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.all(15.0),
        //       child: Image.asset(icon_search,
        //           width: 23,
        //           color: Theme.of(context).textTheme.bodyText1.color),
        //     ),
        //     // Padding(
        //     //   padding: const EdgeInsets.all(15.0),
        //     //   child: Image.asset(icon_store,
        //     //       width: 30, color: Theme.of(context).textTheme.bodyText1.color),
        //     // ),
        //     Padding(
        //       padding: const EdgeInsets.all(15.0),
        //       child: Image.asset(icon_menu,
        //           width: 30,
        //           color: Theme.of(context).textTheme.bodyText1.color),
        //     )
        //   ],
        // ),
        body: SafeArea(
      child: Column(children: [
        Stack(
          children: [
            Positioned(
                top: -120,
                // left: 0,
                right: -120,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.product.backgroundColor,
                  ),
                  width: 390,
                  height: MediaQuery.of(context).size.height / 2,
                )),
            SizedBox(
              height: 650,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Hero(
                      tag: widget.product.id,
                      child: Image.asset(
                        widget.product.imagePath,
                        height: 300,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                            children: [
                              for (Color colorOption
                                  in widget.product.optionColor)
                                InkWell(
                                  onTap: () {
                                    // print("tab");
                                    print(isSelectedColor.toString());
                                    print(colorOption.toString());
                                    print(select);
                                    select += 1;
                                    isSelectedColor = colorOption;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                colorOption == isSelectedColor
                                                    ? colorOption
                                                    : Colors.transparent,
                                            width: 2),
                                        shape: BoxShape.circle),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: colorOption,
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: Text(
                            "\$${widget.product.price}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: widget.product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(text: "\n"),
                        TextSpan(text: "\n"),
                        TextSpan(
                            text: widget.product.description,
                            style: TextStyle(color: Colors.grey, height: 1.4))
                      ])),
                    ),
                    SizedBox(height: 150),
                  ],
                ),
              ),
            ),
            ItemDetailAppBar(),
          ],
        ),
        Expanded(
          child: SizedBox(
            height: 1,
          ),
        ),
        OrderWidget()
      ]),
    ));
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 4,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      gradient: appGradient,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text("PRE-ORDER",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
