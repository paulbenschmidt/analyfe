import 'package:analyfe_app/screens/add_entry_screen.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.teal[100],
        highlightColor: Colors.teal[300],
        dividerColor: Colors.teal[50],
        fontFamily: 'Moderne-Sans-Font',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 30,
              ),
            ),
      ),
      home: AddEntryScreen(),
    );
  }
}
