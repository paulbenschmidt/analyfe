import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ActivityBlock with ChangeNotifier {
  final DateTime id; //unique id to track activity
  final String title; //name of activity (sleep, exercise, etc.)
  final DateTime startTime;
  final DateTime endTime;
  int valueCount;
  double valueSlider;

  ActivityBlock({
    @required this.id,
    @required this.title,
    @required this.startTime,
    @required this.endTime,
    this.valueCount,
    this.valueSlider,
  });

  Future<List<ActivityBlock>> returnList(
      id, title, startTime, endTime, countVal, sliderVal) async {
    //get current user ID
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    final userID = firebaseUser.uid;
    //activity name
    String activity = 'Exercise';
    QuerySnapshot snapshot = await Firestore.instance
        .collection('/Activities/$userID/$activity')
        .getDocuments();

    //final startTime =
    //     DateTime.parse(datasource.data['startTime'].toDate().toString());

    // return snapshot.documents
    //     .map((doc) => ActivityBlock(
    //           'title': DateTime.now(),
    //           'id': activity,
    //           DateTime.parse(doc.data['startTime'].toDate().toString()),
    //           DateTime.parse(doc.data['endTime'].toDate().toString()),
    //           doc.data['countVal'],
    //           doc.data['sliderVal']
    //       ))
    //     .toList();
  }
}
