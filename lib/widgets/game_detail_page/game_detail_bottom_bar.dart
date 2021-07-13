import 'package:flutter/material.dart';
import 'package:stadia_app/pages/game_detail_page.dart';
import 'package:stadia_app/theme/colors.dart';

class GameDetailBottonBar extends StatelessWidget {
  const GameDetailBottonBar({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final GameDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: widget.gameDetail.isPurchased
                    ? appGradient
                    : secondAppGradient,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Text(
                widget.gameDetail.isPurchased ? "PLAY NOW" : "BUY NOW",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text("\$${widget.gameDetail.price} USD",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
