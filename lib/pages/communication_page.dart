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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: appGradient),
        ),
        Positioned(
          top: 100,
          left: -290,
          child: UnconstrainedBox(
            child: Container(
              width: 1000,
              height: 1000,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
        SafeArea(
          child: ListView(
            children: [
              CommunicationTabbarWidget(),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 600,
                child: SingleChildScrollView(
                  child: Column(
                    children: [ChatItemWidget()],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
