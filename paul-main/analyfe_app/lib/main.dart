import 'package:flutter/material.dart';

import './screens/add_entry_screen.dart';
import './style/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        backgroundColor: Colors.grey[200],
        highlightColor: Colors.grey[400],
        dividerColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                color: Colors.blueGrey[700],
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
              bodyText1: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.blueGrey[700],
                fontSize: 25,
              ),
            ),
      ),
      home: AddEntryScreen(),
    );
  }
}
