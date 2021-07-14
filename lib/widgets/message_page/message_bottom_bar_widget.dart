import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';

class MessagePageBottomBarWidget extends StatelessWidget {
  const MessagePageBottomBarWidget({
    Key key,
  }) : super(key: key);

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
                Icons.mic,
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