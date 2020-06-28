import 'package:flutter/material.dart';

import './screens/auth_screen.dart';
import './screens/calendar_screen.dart';
import './style/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme,
      home: AuthScreen(),
    );
  }
}
