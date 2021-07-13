import 'package:flutter/material.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/commons/icon_with_padding.dart';

class CommunicationTabbarWidget extends StatelessWidget {
  const CommunicationTabbarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              UserIcon(
                  size: 60,
                  level: null,
                  color: Colors.green,
                  imagePath: player1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vietlinhtspt",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Online",
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                IconWithPadding(
                  edgeInsetsGeometry: const EdgeInsets.all(8.0),
                  iconData: Icons.search,
                ),
                IconWithPadding(
                  edgeInsetsGeometry: const EdgeInsets.all(8.0),
                  iconData: Icons.add_comment,
                ),
                IconWithPadding(
                  edgeInsetsGeometry: const EdgeInsets.all(8.0),
                  iconData: Icons.person_add,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
