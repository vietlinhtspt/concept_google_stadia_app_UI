import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        this.title,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}
