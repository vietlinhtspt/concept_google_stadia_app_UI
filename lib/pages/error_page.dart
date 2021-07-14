import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "Some thing wrong with our server. Try in minutes or contact our serice: vietlinhtspt@gmail.com"),
      ),
    );
  }
}
