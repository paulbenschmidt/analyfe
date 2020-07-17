import 'package:cloud_firestore/cloud_firestore.dart';
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
            TextField(),
            FlatButton(
                child: Text('Press here to upload to Firebase'),
                onPressed: () {
                  Event.sendToFirebase(
                    activity: 'Sleep',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(new Duration(hours: 2)),
                    sliderValue: null,
                    countValue: null,
                    binaryValue: true,
                  );
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
