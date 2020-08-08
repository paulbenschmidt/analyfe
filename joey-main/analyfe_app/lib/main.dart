import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Delete auxiliary ones later
import 'auxiliary/test_screen.dart';
import 'auxiliary/DB_screen.dart';

import './database/init_database.dart';

import './screens/entry_screen.dart';
import './screens/auth_screen.dart';
import './screens/settings_screen.dart';
import './screens/analytics_screen.dart';

import './style/theme_data.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //Needs to be called before database is initialized
  final Future _init =
      Init.initialize(); //Is this needed before going to EntryScreen???
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analyfe App',
      theme: defaultTheme,
      //Load login screen if user is not authenticated; otherwise change to main screen
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return EntryScreen();
            }
            return AuthScreen();
          }),
      routes: {
        EntryScreen.routeName: (ctx) => EntryScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        AnalyticsScreen.routeName: (ctx) => AnalyticsScreen(),
        //Delete later
        TestScreen.routeName: (ctx) => TestScreen(),
        DatabaseScreen.routeName: (ctx) => DatabaseScreen(),
      },
    );
  }
}
