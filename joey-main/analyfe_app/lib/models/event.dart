import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Events {
  final Event event;

  Events(this.event);
}

class Event {
  final DateTime id;
  final String activity;
  final DateTime startTime;
  final DateTime endTime;
  final double sliderValue;
  final int counterValue;

  Event(
      {this.id,
      this.activity,
      this.startTime,
      this.endTime,
      this.sliderValue,
      this.counterValue});

  //must be a static method to access Event class without instantiating the class
  static void sendToFirebase() async {
    //get user information
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    final userID = firebaseUser.uid;
    //print(userID);
    const activity = 'Sleep';
    Firestore.instance
        .collection('/Activities/$userID/$activity')
        .document(DateTime.now().toString())
        .setData({
      'startTime': DateTime.now(),
      'endTime': DateTime.now().add(new Duration(hours: 2)),
      'sliderVal': 4.3
    });
  }

  //
  static Future<List<Event>> returnList() async {
    //get current user ID
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    final userID = firebaseUser.uid;
    //activity name
    String name = 'Exercise';
    QuerySnapshot snapshot = await Firestore.instance
        .collection('/Activities/$userID/$name')
        .getDocuments();

    return snapshot.documents
        .map(
          (doc) => Event(
            id: DateTime.parse(doc.data['startTime'].toDate().toString()),
            activity: name,
            startTime:
                DateTime.parse(doc.data['startTime'].toDate().toString()),
            endTime: DateTime.parse(doc.data['endTime'].toDate().toString()),
            sliderValue: doc.data['sliderVal'],
            counterValue: doc.data['countVal'],
          ),
        )
        .toList();
  }
}
