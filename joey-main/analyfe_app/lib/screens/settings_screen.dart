import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auxiliary/DB_screen.dart';
import '../auxiliary/test_screen.dart';
import '../models/activity.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Settings and Stuff'),
            TextField(),
            FlatButton(
                child: Text('Press here to upload to Firebase'),
                onPressed: () {
                  final startTime = DateTime.now();
                  Activity.sendToFirebase(
                    id: 1,
                    activity: 'Exercise',
                    startTime: startTime, //DateTime.now(),
                    endTime: startTime.add(new Duration(hours: 2)),
                    sliderValue: null,
                    countValue: null,
                  );
                }),
            SizedBox(height: 12),
            FlatButton(
              child: Text('Firebase Test Screen'),
              onPressed: () {
                //Pop back to login screen and log user out
                Navigator.of(context).pushNamed(TestScreen.routeName);
              },
            ),
            FlatButton(
              child: Text('Local Database Test Screen'),
              onPressed: () {
                //Pop back to login screen and log user out
                Navigator.of(context).pushNamed(DatabaseScreen.routeName);
              },
            ),
            SizedBox(height: 12),
            FlatButton(
              child: Text('Logout'),
              onPressed: () {
                //Pop back to login screen and log user out
                Navigator.of(context).pop();
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
