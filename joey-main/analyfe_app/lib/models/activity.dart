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
  final bool binaryVal;

  Activity({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.sliderVal,
    this.countVal,
    this.binaryVal,
  });

  //
  //
  //Firebase Operations
  //
  //
  static void sendToFirebase({
    int id,
    String activity,
    DateTime startTime, //change to TimeStamp???
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
        .collection('/Records/$userID/Activity: $activity')
        .document(endTime.toString())
        .setData({
      'ID': id,
      'startTime': startTime,
      'endTime': endTime,
      'sliderVal': sliderValue,
      'countVal': countValue,
      'binaryVal': binaryValue,
    });
  }

  //convert Firebase entries to a list
  static Future<List<Activity>> returnList() async {
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
          (doc) => Activity(
            id: doc.data['ID'],
            name: activity,
            startTime: sembast.Timestamp.fromDateTime(
                DateTime.parse(doc.data['startTime'].toDate().toString())),
            endTime: sembast.Timestamp.fromDateTime(
                DateTime.parse(doc.data['endTime'].toDate().toString())),
            sliderVal: doc.data['sliderVal'],
            countVal: doc.data['countVal'],
            binaryVal: doc.data['binaryVal'],
          ),
        )
        .toList();
  }

  //
  //
  //Local Database Operations
  //
  //
  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'startTime': this.startTime,
      'endTime': this.endTime,
      'sliderVal': this.sliderVal,
      'countVal': this.countVal,
      'binaryVal': this.binaryVal,
    };
  }

  factory Activity.fromMap(int id, Map<String, dynamic> map) {
    return Activity(
      id: id,
      name: map['name'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      sliderVal: map['sliderVal'],
      countVal: map['countVal'],
      binaryVal: map['binaryVal'],
    );
  }

  Activity copyWith({
    int id,
    String name,
    DateTime startTime,
    DateTime endTime,
    double sliderVal,
    double countVal,
    bool binaryVal,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      sliderVal: sliderVal ?? this.sliderVal,
      countVal: countVal ?? this.countVal,
      binaryVal: binaryVal ?? this.binaryVal,
    );
  }
}
