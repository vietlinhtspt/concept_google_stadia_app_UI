import 'package:flutter/material.dart';
import 'package:stadia_app/widgets/communication_page/chat_item.dart';
import 'package:stadia_app/widgets/communication_page/communication_tabbar.dart';
import 'package:stadia_app/theme/colors.dart';

class CommunicationPage extends StatefulWidget {
  const CommunicationPage({Key key}) : super(key: key);

  @override
  _CommunicationPageState createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommunicationTabbarWidget(),
      Expanded(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: appGradient),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [ChatItemWidget()],
              ),
            ),
          )
        ],
      ))
    ]);
  }
}
