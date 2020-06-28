import 'package:flutter/material.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  return ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    backgroundColor: Colors.grey[300],
    dividerColor: Colors.grey[500],
    highlightColor: Colors.white,
    textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            color: Colors.blueGrey[700],
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.blueGrey[700],
            fontSize: 18,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700],
            fontSize: 12,
          ),
        ),
  );
}