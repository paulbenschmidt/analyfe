import 'package:sembast/timestamp.dart';

class Outcome {
  final int id;
  final String name;
  final Timestamp recordedTime;
  final double sliderVal;

  Outcome({
    this.id,
    this.name,
    this.recordedTime,
    this.sliderVal,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'recordedTime': this.recordedTime,
      'sliderVal': this.sliderVal,
    };
  }

  factory Outcome.fromMap(int id, Map<String, dynamic> map) {
    return Outcome(
      id: id,
      name: map['name'],
      recordedTime: map['recordedTime'],
      sliderVal: map['sliderVal'],
    );
  }

  Outcome copyWith({
    int id,
    String name,
    DateTime recordedTime,
    double sliderVal,
  }) {
    return Outcome(
      id: id ?? this.id,
      name: name ?? this.name,
      recordedTime: recordedTime ?? this.recordedTime,
      sliderVal: sliderVal ?? this.sliderVal,
    );
  }
}
