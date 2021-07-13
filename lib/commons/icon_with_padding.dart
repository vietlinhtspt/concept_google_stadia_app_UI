import 'package:flutter/material.dart';

class IconWithPadding extends StatelessWidget {
  final IconData iconData;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  const IconWithPadding(
      {Key key, @required this.iconData, @required this.edgeInsetsGeometry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsGeometry,
      child: Icon(
        this.iconData,
        color: Colors.white,
      ),
    );
  }
}
