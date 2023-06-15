import 'package:flutter/material.dart';
import 'CustomeColors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        brightness: Brightness.light,
        visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
        primaryColor: CustomeColors.kPrimaryColor,
        iconTheme: IconThemeData(color: CustomeColors.iconColor),
        accentColor: CustomeColors.iconColor,
        primarySwatch: MaterialColor(
          0xffF2EF21,
          <int, Color>{
            50: CustomeColors.kPrimaryColor,
            100: CustomeColors.kPrimaryColor,
            200: CustomeColors.kPrimaryColor,
            300: CustomeColors.kPrimaryColor,
            400: CustomeColors.kPrimaryColor,
            500: CustomeColors.kPrimaryColor,
            600: CustomeColors.kPrimaryColor,
            700: CustomeColors.kPrimaryColor,
            800: CustomeColors.kPrimaryColor,
            900: CustomeColors.kPrimaryColor
          },
        ),
        primaryColorLight: Color(0x1aF5E0C3),
        primaryColorDark: CustomeColors.kPrimaryColor,
        canvasColor: CustomeColors.kPrimaryColor,
        scaffoldBackgroundColor: CustomeColors.bodyBgColor,
        bottomAppBarColor: Color(0xff6D42CE),
        cardColor: Color(0xaaF5E0C3),
        dividerColor: Color(0x1f6D42CE),
        focusColor: Color(0x1aF5E0C3),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'Roboto', //3
        textTheme: const TextTheme(
            bodyText2: TextStyle(color: CustomeColors.bodyTextColor)),
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomeColors.kPrimaryColor,
        ));
  }
}
