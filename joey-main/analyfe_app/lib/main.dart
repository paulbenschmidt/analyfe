import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; //login

import './screens/entry_screen.dart';
import './screens/auth_screen.dart';
import './screens/settings_screen.dart';
import './screens/test_activity_screen.dart';
import './style/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analyfe App',
      theme: defaultTheme,
      //Load the login screen if the user is not authenticated but change to main screen otherwise
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return EntryScreen();
            }
            return AuthScreen();
          }),
      //List of routes
      routes: {
        EntryScreen.routeName: (ctx) => EntryScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        TestActivityScreen.routeName: (ctx) => TestActivityScreen(),
      },
    );
  }
}
