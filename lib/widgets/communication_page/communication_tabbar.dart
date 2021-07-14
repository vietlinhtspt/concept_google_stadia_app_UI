import 'package:flutter/material.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/commons/icon_with_padding.dart';
import 'package:stadia_app/theme/colors.dart';

class CommunicationTabbarWidget extends StatelessWidget {
  const CommunicationTabbarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: appGradient),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserIcon(
                      size: 60,
                      level: null,
                      color: Colors.green,
                      imagePath: player1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
