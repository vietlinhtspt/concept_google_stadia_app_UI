import 'package:flutter/material.dart';
import 'package:stadia_app/models/last_played_game.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:stadia_app/widgets/game_detail_page/game_detail_bottom_bar.dart';
import 'package:stadia_app/widgets/game_detail_page/game_detail_info_widget.dart';

class GameDetailPage extends StatefulWidget {
  final GameDetail gameDetail;
  const GameDetailPage({Key key, @required this.gameDetail}) : super(key: key);

  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;

  bool _isPlayerReady = false;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.gameDetail.videoIntro,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    void listener() {
      if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
        setState(() {
          _playerState = _controller.value.playerState;
          _videoMetaData = _controller.metadata;
        });
      }
    }

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    _controller.addListener(listener);
                  },
                ),
              ),
              SizedBox(
                height: 370,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.gameDetail.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.gameDetail.company,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.grey[600])),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GameDetailInfoWidget(
                                  title: widget.gameDetail.rating.toString(),
                                  subTitle: "Rating",
                                  hasIcons: true,
                                ),
                                Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey,
                                ),
                                GameDetailInfoWidget(
                                  title: reFormatNumber(
                                      widget.gameDetail.downloadedNumber),
                                  subTitle: "Downloads",
                                ),
                                Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey,
                                ),
                                GameDetailInfoWidget(
                                  title: reFormatNumber(
                                      widget.gameDetail.reviewdNumber),
                                  subTitle: "Reivews",
                                )
                              ],
                            ),
                          ),
                          Text(widget.gameDetail.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Colors.grey[600], fontSize: 17)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GameDetailBottonBar(widget: widget),
                ),
              )
            ],
          ),
        ));
  }

  String reFormatNumber(int downloadedNumber) {
    return "10M";
  }
}
