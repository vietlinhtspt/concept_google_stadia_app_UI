import 'package:flutter/material.dart';

class GameDetailInfoWidget extends StatelessWidget {
  final bool hasIcons;
  final String title, subTitle;
  const GameDetailInfoWidget({
    Key key,
    @required this.title,
    @required this.subTitle,
    this.hasIcons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(
            this.title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          if (this.hasIcons)
            Icon(
              Icons.star,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
        ],
      ),
      Text(this.subTitle,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.grey[600])),
    ]);
  }
}