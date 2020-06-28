import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../style/soft_ui.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: _entryAppBar(context),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 250,
                height: 540,
                decoration: SoftUi.boxDecoration(context),
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      calendarHours(context),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 540,
                decoration: SoftUi.boxDecoration(context),
                child: Center(
                  child: Text(
                    'Activities',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

AppBar _entryAppBar(context) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    elevation: 0,
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
              child: Icon(Icons.history),
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

Column calendarHours(context) {
  final List<String> hoursInDay = [
    '12 AM',
    '1 AM',
    '2 AM',
    '3 AM',
    '4 AM',
    '5 AM',
    '6 AM',
    '7 AM',
    '8 AM',
    '9 AM',
    '10 AM',
    '11 AM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM',
    '4 PM',
    '5 PM',
    '6 PM',
    '7 PM',
    '8 PM',
    '9 PM',
    '10 PM',
    '11 PM',
    '12 AM',
  ];

  return new Column(
    children: hoursInDay
        .map(
          (item) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Expanded(
                  child: Divider(
                    indent: 10,
                    thickness: 1,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList(),
  );
}
