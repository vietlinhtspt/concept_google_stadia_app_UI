import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';

class ItemDetailAppBar extends StatelessWidget {
  const ItemDetailAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).textTheme.bodyText1.color,
              size: 30,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Hero(
                tag: "searching_icon",
                child: Image.asset(icon_search,
                    width: 23,
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Hero(
                tag: "store_icon",
                child: Image.asset(icon_store,
                    width: 30,
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
            Padding(
            
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: "menu_icon",
                child: Image.asset(icon_menu,
                    width: 30,
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
            )
          ],
        )
      ],
    );
  }
}
