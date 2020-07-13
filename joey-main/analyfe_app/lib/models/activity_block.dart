import 'package:flutter/material.dart';

class ActivityBlock with ChangeNotifier {
  final int id; //unique id to track activity
  final String title; //name of activity (sleep, exercise, etc.)
  final DateTime startTime;
  final DateTime endTime;
  bool isCounter; //enable a counter (e.g. 1,2,3,...)
  bool isSlider; //enable a slider (e.g. from 1-10)
  int valueCount;
  double valueSlider;

  ActivityBlock({
    @required this.id,
    @required this.title,
    @required this.startTime,
    @required this.endTime,
    this.isCounter,
    this.isSlider,
    this.valueCount,
    this.valueSlider,
  });

  Map<String, dynamic> toMap() {
    //code to turn class object into map for storage
    return {
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
      //if values are true then add them, if not leave blank
      isCounter ? 'valueCount' : valueCount: null,
      isSlider ? 'valueSlider' : valueSlider: null,
    };
  }

  factory ActivityBlock.fromMap(int id, Map<String, dynamic> map) {
    //extract data from map
    return ActivityBlock(
      id: id,
      title: map['title'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      //HOW TO GET OTHER DATA WITHOUT USING IF STATEMENT???
      valueCount: map['valueCount'], //will this return null if not there?
      valueSlider: map['valueSlider'],
    );
  }

  //this function copies the table but overwrites any changed values to be updated in the database
  ActivityBlock copyWith(
      {int id,
      String title,
      DateTime startTime,
      DateTime endTime,
      int valueCount,
      double sliderValue}) {
    return ActivityBlock(
        id: id ?? this.id,
        title: title ?? this.title, //is this one necessary???
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        valueCount: valueCount ?? this.valueCount,
        valueSlider: valueSlider ?? this.valueSlider);
  }

  //Function to set tracking of additional informaiton to true/false
  void _setTrackers(bool setCounter, bool setSlider) {
    isCounter = setCounter;
    isSlider = setSlider;
  }

  //Function to setup couting.slider value updates
  void _updateTrackers(int count, double slide) {
    //MAKE tHE SLIDE VALUE INTEGER OR DOUBLE?
    if (isCounter) {
      valueCount = count;
      //UPDATE FIREBASE VALUE TO SHOW THIS
    }
    if (isSlider) {
      valueSlider = slide;
      //UPDATE FIREBASE VALUE TO SHOW THIS
    }
  }
}
