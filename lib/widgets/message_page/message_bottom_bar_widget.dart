import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/communication_cubit.dart';

class MessagePageBottomBarWidget extends StatefulWidget {
  final QueryDocumentSnapshot messageSnapshot;
  const MessagePageBottomBarWidget({Key key, @required this.messageSnapshot})
      : super(key: key);

  @override
  _MessagePageBottomBarWidgetState createState() =>
      _MessagePageBottomBarWidgetState();
}

class _MessagePageBottomBarWidgetState
    extends State<MessagePageBottomBarWidget> {
  bool isSendTextMessage = false;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      if (textEditingController.text.trim().isEmpty) {
        setState(() {
          isSendTextMessage = false;
        });
      } else {
        setState(() {
          isSendTextMessage = true;
        });
      }
    });
  }

  void onSendMessage() {
    BlocProvider.of<CommunicationCubit>(context).sendMessages(
        this.textEditingController.text, widget.messageSnapshot.id);
    cleanMessage();
  }

  void cleanMessage() {
    this.textEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              stadia_logo_with_name,
              height: 40,
            ),
            Expanded(
              child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Text message",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Theme.of(context).hintColor,
                        width: 1.0,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                onSendMessage();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  this.isSendTextMessage ? Icons.send : Icons.mic,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.add_circle_sharp,
                color: Theme.of(context).hintColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.image,
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
