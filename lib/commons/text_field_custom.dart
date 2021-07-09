import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final double width, height;
  final EdgeInsetsGeometry padding;
  final bool obscureText, isValidInput;
  const TextFieldCustom({
    Key key,
    @required TextEditingController passwordController,
    this.labelText,
    this.obscureText = false,
    this.isValidInput = false,
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
            obscureText: this.obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: this.labelText ?? "",
              focusedBorder: this.isValidInput
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.greenAccent[100], width: 2.0),
                    )
                  : OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2.0),
                    ),
              // errorText: this.isValidInput ? "" : "Invalid input"),
            )),
      ),
    );
  }
}
