import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../style/soft_ui.dart';

class AddEntryScreen extends StatefulWidget {
  @override
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: _entryAppBar(context),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                width: 350,
                height: 135,
                decoration: SoftUi.boxDecoration(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          'Wake',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 85,
                      width: 150,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (dateTime) {
                          setState(() {
                            dateTime = _dateTime;
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ]),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 155,
                decoration: SoftUi.boxDecoration(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Learning',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_drop_up),
                          iconSize: 50.0,
                          onPressed: () {},
                        ),
                        Container(
                          child: Text(
                            '8',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 50.0,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 155,
                decoration: SoftUi.boxDecoration(context),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 155,
                decoration: SoftUi.boxDecoration(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar _entryAppBar(context) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    elevation:0,
    centerTitle: true,
    bottom: PreferredSize(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: FlatButton(
              onPressed: () {},
              child: Icon(Icons.chevron_left),
            ),
            decoration: SoftUi.boxDecoration(context),
            width: 60,
          ),
          Text(
            'Entry',
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            child: FlatButton(
              onPressed: () {},
              child: Icon(Icons.file_upload),
            ),
            decoration: SoftUi.boxDecoration(context),
            width: 60,
          ),
        ],
      ),
      preferredSize: null,
    ),
  );
}
