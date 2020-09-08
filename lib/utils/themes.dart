import 'package:eWalle/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData defaultLightTheme = ThemeData.light();
ThemeData defaultDarkTheme = ThemeData.dark();

ThemeData lightTheme = defaultLightTheme.copyWith(
  primaryColor: kYellow,
  scaffoldBackgroundColor: kWhite,
  cardColor: kLight,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: kBlack,
    backgroundColor: kYellow,
  ),
  textTheme: TextTheme(
    // headline1: TextStyle(),
    caption: kBodyFontStyle.copyWith(
      color: kNavy,
      fontSize: 12,
    ),
    bodyText1: kBodyFontStyle,
    bodyText2: kBodyFontStyle.copyWith(
      color: kNavy,
      fontSize: 13,
    ),
    button: kBodyFontStyle.copyWith(
      color: kDark,
      fontSize: 16,
    ),
    subtitle1: kBodyFontStyle.copyWith(
      color: kNavy,
      fontSize: 16,
    ),
    headline2: kBodyFontStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: kCharcoal,
    ),
  ),
);

ThemeData darkTheme = defaultDarkTheme.copyWith(
  primaryColor: kYellow,
  scaffoldBackgroundColor: kBlack,
  cardColor: kDark,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: kBlack,
    backgroundColor: kYellow,
  ),
  textTheme: TextTheme(
    // headline1: TextStyle(),
    caption: kBodyFontStyle.copyWith(
      color: kNavy,
      fontSize: 12,
    ),
    bodyText1: kBodyFontStyle,
    bodyText2: kBodyFontStyle.copyWith(
      color: kNavy,
      fontSize: 13,
    ),
    button: kBodyFontStyle.copyWith(
      color: kDark,
      fontSize: 16,
    ),
    subtitle1: kBodyFontStyle.copyWith(
      color: kNavy,
      fontSize: 16,
    ),
    headline2: kBodyFontStyle.copyWith(
      fontSize: 24,
      color: kCharcoal,
    ),
  ),
);
