import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/event.dart';

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
            Text('boop'),
            FlatButton(
                child: Text('Press here'),
                onPressed: () async {
                  Event.sendToFirebase();
                }),
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
