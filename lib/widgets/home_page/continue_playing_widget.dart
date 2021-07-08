import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/models/last_played_game.dart';
import 'package:stadia_app/theme/colors.dart';

class ContinuePlayingWidget extends StatelessWidget {
  const ContinuePlayingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var game in lastPlayedGames)
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 120,
                  decoration: BoxDecoration(
                      gradient: secondAppGradient,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width *
                      0.9 *
                      game.gameProgress,
                  height: 120,
                  decoration: BoxDecoration(
                      gradient: appGradient,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          game.imagePath,
                          height: 100,
                          // width: 40,
                        ),
                      ),
                      Positioned(
                          left: 22,
                          top: 32,
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          )),
                      Positioned(
                        left: 30,
                        top: 39,
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
                            text: game.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        TextSpan(text: "\n"),
                        TextSpan(
                            text: "${game.hoursPlayed.toString()} hours played",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                height: 1.5)),
                      ])),
                    )
                  ]),
                )
              ],
            )
        ],
      ),
    );
  }
}
