import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final DateTime id;
  final String activityName;
  final DateTime startTime;
  final DateTime endTime;
  final double sliderValue;
  final int counterValue;
  final bool binaryValue;

  Event({
    this.id,
    this.activityName,
    this.startTime,
    this.endTime,
    this.sliderValue,
    this.counterValue,
    this.binaryValue,
  });

  //must be a static method to access Event class without instantiating the class
  static void sendToFirebase({
    String activity,
    DateTime startTime,
    DateTime endTime,
    double sliderValue,
    double countValue,
    bool binaryValue,
  }) async {
    //get user information
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    final userID = firebaseUser.uid;
    //print(userID);
    Firestore.instance
        .collection('/Activities/$userID/$activity')
        .document(endTime.toString())
        .setData({
      'startTime': startTime,
      'endTime': endTime,
      'sliderVal': sliderValue,
      'countVal': countValue,
      'binaryVal': binaryValue,
    });
  }

  //convert Firebase entries to a list
  static Future<List<Event>> returnList() async {
    //get current user ID
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    final userID = firebaseUser.uid;
    //activity name
    String activity = 'Sleep'; //needs to access all activities
    QuerySnapshot snapshot = await Firestore.instance
        .collection('/Activities/$userID/$activity')
        .getDocuments();

    return snapshot.documents
        .map(
          (doc) => Event(
            id: DateTime.parse(doc.data['startTime'].toDate().toString()),
            activityName: activity,
            startTime:
                DateTime.parse(doc.data['startTime'].toDate().toString()),
            endTime: DateTime.parse(doc.data['endTime'].toDate().toString()),
            sliderValue: doc.data['sliderVal'],
            counterValue: doc.data['countVal'],
            binaryValue: doc.data['binaryVal'],
          ),
        )
        .toList();
  }
}
