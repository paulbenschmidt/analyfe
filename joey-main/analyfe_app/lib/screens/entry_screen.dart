import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/entry_screen_widgets.dart';
import '../style/soft_ui.dart';

class EntryScreen extends StatefulWidget {
  static const routeName = '/entry_screen';
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 35.0 * 6);
  var accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: entryAppBar(context),
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
                  controller: _scrollController,
                  child: Stack(
                    children: [
                      calendarHours(context),
                      Padding(
                        padding: EdgeInsets.only(left: 55, top: 18),
                        child: Container(
                          width: 150,
                          height: 864,
                          child: stackOfRecordedActivities(context, 864),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 200, top: 3),
                        child: Container(
                          width: 150,
                          height: 894,
                          child: //Container(color: Colors.orange,)
                              stackOfMoods(context, 894),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                width: 100,
                height: 540,
                decoration: SoftUi.boxDecoration(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: activityOptions(context, 540),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
