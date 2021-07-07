import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/models/last_played_game.dart';
import 'package:stadia_app/theme/colors.dart';

class LastPlayedGameTile extends StatelessWidget {
  const LastPlayedGameTile({
    Key key,
    @required this.playedGameItem,
    @required this.screenWidth,
  }) : super(key: key);

  final LastPlayedGame playedGameItem;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  playedGameItem.imagePath,
                  height: 60,
                  width: 40,
                ),
              ),
              Positioned(
                  left: 7,
                  top: 15,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  )),
              Positioned(
                left: 15,
                top: 22,
                child: Image.asset(
                  icon_player,
                  width: 12,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: playedGameItem.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontWeight: FontWeight.bold)),
                TextSpan(text: "\n"),
                TextSpan(
                    text:
                        "${playedGameItem.hoursPlayed.toString()} hours played",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(height: 1.5)),
              ])),
            )
          ]),
          Stack(
            children: [
              Container(
                width: screenWidth * 0.12,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
              ),
              Container(
                  width: screenWidth * 0.12 * playedGameItem.gameProgress,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: appGradient,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
