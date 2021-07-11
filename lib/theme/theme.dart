import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stadia_app/theme/colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    hintColor: hintColor,
    cardColor: Colors.grey[300],
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.grey.withOpacity(0.5),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    iconTheme: IconThemeData(color: Colors.grey[600]),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    hintColor: hintColor,
    scaffoldBackgroundColor: Colors.black,
    shadowColor: Colors.black.withOpacity(0.5),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    iconTheme: IconThemeData(color: Colors.grey[350]),
  );
}
