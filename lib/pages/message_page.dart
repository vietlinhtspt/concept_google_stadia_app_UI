import 'package:flutter/material.dart';
import 'package:stadia_app/models/message_model.dart';
import 'package:stadia_app/theme/colors.dart';
import 'package:stadia_app/widgets/message_page/message_bottom_bar_widget.dart';
import 'package:stadia_app/widgets/message_page/message_item_widget.dart';
import 'package:stadia_app/widgets/message_page/tabbar_widget.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: appGradient),
        child: Column(children: [
          MessagePageTabbarWidget(),
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height - 80,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (BuildContext buildContext, int index) {
                          return MessageItemWidget(message: messages[index]);
                        }),
                  ),
                  MessagePageBottomBarWidget()
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}



