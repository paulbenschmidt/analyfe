import 'package:analyfe_app/models/activity.dart';
import 'package:analyfe_app/models/outcome.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sembast/timestamp.dart';

import '../providers/activity_records.dart';
import '../providers/outcome_records.dart';

void addRecord(context, date, type, data) {
  DateTime startTime = DateTime.now();
  DateTime endTime = startTime.add(Duration(hours: 1));
  double sliderValue = 0.5;
  var formattedDate = DateTime.parse(date);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: Stack(
            overflow: Overflow.visible,
            children: type == "Outcome"
                ? <Widget>[
                    Positioned(
                      right: -40.0,
                      top: -40.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      height: 450,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Record $type: \n${data.name}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Center(
                                    child: Text('Time'),
                                  ),
                                ),
                                SizedBox(
                                  height: 75,
                                  width: 200,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: startTime,
                                    onDateTimeChanged: (updatedStartTime) {
                                      startTime = updatedStartTime;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Center(
                                    child: Text('Quality'),
                                  ),
                                ),
                                Slider(
                                  inactiveColor: Colors.grey,
                                  activeColor: Colors.blueGrey,
                                  value: sliderValue,
                                  label: '${(sliderValue * 10).toInt()}',
                                  onChanged: (newSliderValue) {
                                    setState(() {
                                      sliderValue = newSliderValue;
                                    });
                                  },
                                  divisions: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text("Record"),
                                    onPressed: () {
                                      Outcome newEntry = Outcome(
                                        id: 1,
                                        name: data.name,
                                        recordedTime:
                                            Timestamp.fromDateTime(DateTime(
                                          formattedDate.year,
                                          formattedDate.month,
                                          formattedDate.day,
                                          startTime.hour,
                                          startTime.minute,
                                        )),
                                        sliderVal: (sliderValue * 10),
                                      );
                                      Provider.of<OutcomeRecords>(
                                        context,
                                        listen: false,
                                      ).addOutcomeEntry(newEntry);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                : <Widget>[
                    Positioned(
                      right: -40.0,
                      top: -40.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      height: 450,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Record $type: \n${data.name}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Center(
                                    child: Text('Start Time'),
                                  ),
                                ),
                                SizedBox(
                                  height: 75,
                                  width: 200,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: startTime,
                                    onDateTimeChanged: (updatedStartTime) {
                                      startTime = updatedStartTime;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Center(
                                    child: Text('End Time'),
                                  ),
                                ),
                                SizedBox(
                                  height: 75,
                                  width: 200,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: endTime,
                                    onDateTimeChanged: (updatedEndTime) {
                                      endTime = updatedEndTime;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Center(
                                    child: Text('Quality'),
                                  ),
                                ),
                                Slider(
                                  inactiveColor: Colors.grey,
                                  activeColor: Colors.blueGrey,
                                  value: sliderValue,
                                  label: '${(sliderValue * 10).toInt()}',
                                  onChanged: (newSliderValue) {
                                    setState(() {
                                      sliderValue = newSliderValue;
                                    });
                                  },
                                  divisions: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text("Record"),
                                    onPressed: () {
                                      Activity newEntry = Activity(
                                        id: 1,
                                        name: data.name,
                                        startTime:
                                            Timestamp.fromDateTime(DateTime(
                                          formattedDate.year,
                                          formattedDate.month,
                                          formattedDate.day,
                                          startTime.hour,
                                          startTime.minute,
                                        )),
                                        endTime:
                                            Timestamp.fromDateTime(DateTime(
                                          formattedDate.year,
                                          formattedDate.month,
                                          formattedDate.day,
                                          endTime.hour,
                                          endTime.minute,
                                        )),
                                        sliderVal: sliderValue,
                                      );
                                      Provider.of<ActivityRecords>(
                                        context,
                                        listen: false,
                                      ).addActivityEntry(newEntry);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
          ),
        );
      });
    },
  );
}
