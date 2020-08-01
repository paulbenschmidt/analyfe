import 'package:sembast/timestamp.dart';

class Activity {
  final int id;
  final String name;
  final Timestamp startTime;
  final Timestamp endTime;
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
