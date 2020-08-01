import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; //login
import 'package:provider/provider.dart';

import './screens/test_screen.dart';
import './screens/entry_screen.dart';
import './screens/auth_screen.dart';
import './screens/settings_screen.dart';
import './screens/analytics_screen.dart';
import './screens/DB_screen.dart';

import './providers/activities.dart';
import './providers/outcomes.dart';
import './providers/activity_records.dart';
import './providers/outcome_records.dart';

import './database/init_database.dart';

import './style/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Future _init = Init.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Activities(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Outcomes(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ActivityRecords(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OutcomeRecords(),
        ),
      ],
      child: MaterialApp(
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
          AnalyticsScreen.routeName: (ctx) => AnalyticsScreen(),
          TestScreen.routeName: (ctx) => TestScreen(),
          DatabaseScreen.routeName: (ctx) => DatabaseScreen(),
        },
      ),
    );
  }
}
