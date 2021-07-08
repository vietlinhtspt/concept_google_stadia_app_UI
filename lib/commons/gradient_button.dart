import 'package:flutter/material.dart';
import 'package:stadia_app/theme/colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final double elevation, borderRadius, height, width, fontSize;
  final Gradient gradient;
  final Color textColor;
  final bool isBold;
  final onTap;
  final EdgeInsetsGeometry padding;
  const GradientButton({
    Key key,
    @required this.text,
    this.onTap,
    this.elevation = 4,
    this.borderRadius = 10,
    this.height = 40,
    this.width = 300,
    this.fontSize = 15,
    this.padding = const EdgeInsets.all(8.0),
    this.gradient =
        const LinearGradient(colors: [kPrimaryColor, kSecondaryColor]),
    this.textColor = Colors.white,
    this.isBold = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: this.onTap,
        child: Material(
            elevation: this.elevation,
            borderRadius: BorderRadius.circular(this.borderRadius),
            child: Container(
              height: this.height,
              width: this.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(this.borderRadius),
                  gradient: this.gradient),
              child: Center(
                child: Text(this.text,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: this.textColor,
                        fontWeight: this.isBold ? FontWeight.bold : null,
                        fontSize: this.fontSize)),
              ),
            )),
      ),
    );
  }
}
