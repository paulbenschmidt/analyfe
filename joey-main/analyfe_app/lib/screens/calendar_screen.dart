import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './settings_screen.dart';
import '../style/soft_ui.dart';

class CalendarScreen extends StatefulWidget {
  static const routeName = '/calendar';

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
                width: 250,
                height: 540,
                decoration: SoftUi.boxDecoration(context),
                child: Center(
                  child: Text(
                    'Calendar',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 540,
                decoration: SoftUi.boxDecoration(context),
                child: Center(
                  child: Text(
                    'Monkey Diaper Rash',
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
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
              child: Icon(Icons.settings),
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
