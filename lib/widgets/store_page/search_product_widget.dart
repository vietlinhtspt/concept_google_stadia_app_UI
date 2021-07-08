import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              icon_search,
              width: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            "Search Google products",
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
