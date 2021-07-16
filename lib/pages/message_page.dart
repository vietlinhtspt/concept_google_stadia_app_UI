import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadia_app/theme/colors.dart';
import 'package:stadia_app/widgets/message_page/message_bottom_bar_widget.dart';
import 'package:stadia_app/widgets/message_page/message_item_widget.dart';
import 'package:stadia_app/widgets/message_page/tabbar_widget.dart';

class MessagePage extends StatefulWidget {
  final QueryDocumentSnapshot messageSnapshot;
  const MessagePage(this.messageSnapshot, {Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 500),
      () => _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 1000)),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: appGradient),
        child: Column(children: [
          MessagePageTabbarWidget(widget.messageSnapshot),
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
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('messages')
                          .doc(widget.messageSnapshot.id)
                          .collection(widget.messageSnapshot.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (_scrollController.hasClients)
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 1000),
                          );

                        return ListView.builder(
                            reverse: false,
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder:
                                (BuildContext buildContext, int index) {
                              return MessageItemWidget(
                                  message: snapshot.data.docs[index]);
                            });
                      },
                    ),
                  ),
                  MessagePageBottomBarWidget(
                    messageSnapshot: widget.messageSnapshot,
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
