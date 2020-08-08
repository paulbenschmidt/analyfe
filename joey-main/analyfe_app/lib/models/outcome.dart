import 'package:sembast/timestamp.dart' as sembast;

class Outcome {
  final int id;
  final String name;
  final sembast.Timestamp recordedTime;
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

  factory Outcome.fromMap(int id, Map<String, dynamic> outcomeMap) {
    return Outcome(
      id: id,
      name: outcomeMap['name'],
      recordedTime: outcomeMap['recordedTime'],
      sliderVal: outcomeMap['sliderVal'],
    );
  }

  Outcome copyWith({
    int id,
    String name,
    DateTime recordedTime, //Necessary to change to Timestamp?
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
