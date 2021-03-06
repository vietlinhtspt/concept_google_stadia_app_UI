import 'package:flutter/material.dart';
import 'package:stadia_app/pages/game_detail_page.dart';
import 'package:stadia_app/models/last_played_game.dart';

class PopularWithFriendWidget extends StatelessWidget {
  const PopularWithFriendWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var game in popularGames)
                InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GameDetailPage(
                                  gameDetail: game,
                                )))
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      // color: Colors.black,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 28.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                game.imagePath,
                                height: 200,
                              ),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 10,
                          //   right: 40,
                          //   child: Material(
                          //     elevation: 4,
                          //     borderRadius: BorderRadius.circular(10),
                          //     child: Container(
                          //       margin: EdgeInsets.symmetric(
                          //           vertical: 7, horizontal: 15),
                          //       child: Text(
                          //         "Play",
                          //         style: TextStyle(
                          //             color: Theme.of(context).primaryColor,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      )),
                )
            ],
          )),
    );
  }
}
