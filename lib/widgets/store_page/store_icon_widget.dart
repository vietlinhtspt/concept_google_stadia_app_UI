import 'package:flutter/material.dart';

class StoreButtonWidget extends StatelessWidget {
  final String title;
  const StoreButtonWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(15)),
      child: Text(
        this.title,
        style: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
