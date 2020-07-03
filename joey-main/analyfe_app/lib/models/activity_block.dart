import 'package:flutter/cupertino.dart';

class ActivityBlock with ChangeNotifier {
  final String id; //unique id to track activity
  final String title; //name of activity (sleep, exercise, etc.)
  bool isCounter; //enable a counter (e.g. 1,2,3,...)
  bool isSlider; //enable a slider (e.g. from 1-10)
  int valueCount;
  double valueSlider;

  ActivityBlock({
    @required this.id,
    @required this.title,
    @required this.isCounter,
    @required this.isSlider,
    this.valueCount,
    this.valueSlider,
  });

  void _setTrackers(bool setCounter, bool setSlider) {
    isCounter = setCounter; //set Counter to true/false
    isSlider = setSlider; //set Slider to true/false
  }

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
