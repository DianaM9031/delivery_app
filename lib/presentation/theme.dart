import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static const purple = Color(0xFF5117AC);
  static const green = Color(0xFF20D0C4);
  static const dark = Color(0xFF03091E);
  static const grey = Color(0xFF212738);
  static const lightGrey = Color(0xFFBBBBBB);
  static const veryLightGrey = Color(0xFFF3F3F3);
  static const white = Color(0xFFFFFFFF);
  static const pink = Color(0xFFF5638B);
}

final deliveryGradients = [
  DeliveryColors.green,
  DeliveryColors.purple,
];

final _borderLight = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: DeliveryColors.veryLightGrey,
      width: 2,
      style: BorderStyle.solid,
    ));

final _borderDark = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: DeliveryColors.dark,
      width: 2,
      style: BorderStyle.solid,
    ));

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
          fontSize: 20.0,
          color: DeliveryColors.purple,
          fontWeight: FontWeight.bold
      ),
    ),
  ),
  canvasColor: DeliveryColors.white,
  accentColor: DeliveryColors.purple,
  bottomAppBarColor: DeliveryColors.veryLightGrey,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderLight,
    enabledBorder: _borderLight,
    focusedBorder: _borderLight,
    contentPadding: EdgeInsets.zero,
    hintStyle: GoogleFonts.poppins(
        color: DeliveryColors.lightGrey, fontSize: 10.0),
    labelStyle: TextStyle(
      color: DeliveryColors.purple,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.purple,
  ),
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.purple,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
          fontSize: 20.0,
          color: DeliveryColors.white,
          fontWeight: FontWeight.bold
      ),
    ),
  ),
  canvasColor: DeliveryColors.grey,
  scaffoldBackgroundColor: DeliveryColors.dark,
  accentColor: DeliveryColors.white,
  bottomAppBarColor: Colors.transparent,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.green,
    displayColor: DeliveryColors.green,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderDark,
    enabledBorder: _borderDark,
    focusedBorder: _borderDark,
    contentPadding: EdgeInsets.zero,
    fillColor: DeliveryColors.grey,
    filled: true,
    hintStyle:
    GoogleFonts.poppins(color: DeliveryColors.white, fontSize: 10.0),
    labelStyle: TextStyle(
      color: DeliveryColors.white,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.white,
  ),
);
