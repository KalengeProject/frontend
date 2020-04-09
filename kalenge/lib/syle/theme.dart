import 'package:flutter/material.dart';

const PrimaryColorLight = const Color(0xFFF0BC02);
const PrimaryColorDark = const Color(0xFF005354);

const SecondaryColorLight = const Color(0xFFffffff);
const SecondaryColorDark = const Color(0xFF82ada9);

const Background = const Color(0xFFffffff);

const TextColor = const Color(0xFFF0BC02);
const TextColor2 = const Color(0xFF000000);

const TextButtonColor = const Color(0xFFFFFFFF);

const DarkBackground = const Color(0xFF222727);

class MyTheme {
  static final ThemeData defaultTheme = _buildTheme();

  static ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: SecondaryColorLight,
      accentColorBrightness: Brightness.dark,

      primaryColor: PrimaryColorLight,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      primaryColorBrightness: Brightness.dark,

      backgroundColor: Background,

      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFF0BC02), // Background color (orange in my case).
        textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
      ),

      scaffoldBackgroundColor: Background,
      cardColor: Background,
      textSelectionColor: PrimaryColorLight,

      textTheme: base.textTheme.copyWith(
          title: base.textTheme.title.copyWith(color: TextColor,fontSize: 60, fontWeight: FontWeight.bold,),
          body1: base.textTheme.body1.copyWith(color: TextColor2),
          body2: base.textTheme.body2.copyWith(color: TextColor,fontWeight: FontWeight.bold,),
          button: base.textTheme.button.copyWith(color: TextButtonColor,fontSize: 17,fontWeight: FontWeight.bold,)
      ),
    );
  }

  static final ThemeData darkTheme = _buildDarkTheme();

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      accentColorBrightness: Brightness.dark,

      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      primaryColorBrightness: Brightness.dark,

      buttonTheme: base.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.primary,
      ),

      scaffoldBackgroundColor: DarkBackground,
      cardColor: DarkBackground,
      textSelectionColor: PrimaryColorLight,
      backgroundColor: Background,

      textTheme: base.textTheme.copyWith(
          title: base.textTheme.title.copyWith(color: TextColor),
          body1: base.textTheme.body1.copyWith(color: TextColor),
          body2: base.textTheme.body2.copyWith(color: TextColor)
      ),
    );
  }
}