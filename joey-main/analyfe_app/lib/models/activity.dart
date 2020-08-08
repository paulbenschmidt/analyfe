import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sembast/timestamp.dart' as sembast;

class Activity {
  final int id;
  final String name;
  final sembast.Timestamp startTime;
  final sembast.Timestamp endTime;
  final double sliderVal;
  final double countVal;

  Activity({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.sliderVal,
    this.countVal,
  });

  //Firebase Operations
  static void sendToFirebase({
    int id,
    String activity,
    DateTime startTime, //Change to Timestamp
    DateTime endTime,
    double sliderValue,
    double countValue,
  }) async {
    //Get user information
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    final userID = firebaseUser.uid;
    Firestore.instance
        .collection('/Records/$userID/Activity: $activity')
        .document(endTime.toString())
        .setData({
      'ID': id,
      'startTime': startTime, //Change from Timestamp to DateTime
      'endTime': endTime, //Change from Timestamp to DateTime
      'sliderVal': sliderValue,
      'countVal': countValue,
    });
  }

  //Download data from FireStore in form of list
  static Future<List<Activity>> returnList() async {
    //Get current user ID
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    final userID = firebaseUser.uid;
    String activity = 'Sleep'; //Needs to access all activities
    QuerySnapshot snapshot = await Firestore.instance
        .collection('/Activities/$userID/$activity')
        .getDocuments();

    return snapshot.documents
        .map(
          (doc) => Activity(
            id: doc.data['ID'],
            name: activity,
            startTime: sembast.Timestamp.fromDateTime(
                DateTime.parse(doc.data['startTime'].toDate().toString())),
            endTime: sembast.Timestamp.fromDateTime(
                DateTime.parse(doc.data['endTime'].toDate().toString())),
            sliderVal: doc.data['sliderVal'],
            countVal: doc.data['countVal'],
          ),
        )
        .toList();
  }

  //Local Database Operations
  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'startTime': this.startTime,
      'endTime': this.endTime,
      'sliderVal': this.sliderVal,
      'countVal': this.countVal,
    };
  }

  factory Activity.fromMap(int id, Map<String, dynamic> activityMap) {
    return Activity(
      id: id,
      name: activityMap['name'],
      startTime: activityMap['startTime'],
      endTime: activityMap['endTime'],
      sliderVal: activityMap['sliderVal'],
      countVal: activityMap['countVal'],
    );
  }

  Activity copyWith({
    int id,
    String name,
    DateTime startTime, //Necessary to change to Timestamp?
    DateTime endTime,
    double sliderVal,
    double countVal,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      sliderVal: sliderVal ?? this.sliderVal,
      countVal: countVal ?? this.countVal,
    );
  }
}
