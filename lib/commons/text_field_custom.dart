import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final double width, height;
  final EdgeInsetsGeometry padding;
  const TextFieldCustom({
    Key key,
    @required TextEditingController passwordController,
    this.labelText,
    this.width = 300,
    this.height = 40,
    this.padding,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: this.width,
        height: this.height,
        child: TextField(
          controller: this._passwordController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.labelText ?? "",
          ),
        ),
      ),
    );
  }
}
