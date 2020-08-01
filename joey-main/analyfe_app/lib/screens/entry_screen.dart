import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/entry_screen_widgets.dart';
import '../style/soft_ui.dart';

class EntryScreen extends StatefulWidget {
  static const routeName = '/entry_screen';
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 35.0 * 6);

  AnimationController _controller;
  Animation<double> _leftAnimation;
  Animation<double> _leftOpactiyAnimation;
  Animation<double> _rightAnimation;
  bool editActivityOptions = false;

  // Animations to enable edit event options screen
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 350,
      ),
    );
    _leftAnimation = Tween(begin: 250.0, end: 57.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.250,
          0.900,
          curve: Curves.easeIn,
        ),
      ),
    );
    _leftOpactiyAnimation = Tween(begin: 1.0, end: 0.5).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.0,
          0.900,
          curve: Curves.easeIn,
        ),
      ),
    );
    _rightAnimation =
        Tween(begin: 100.0, end: 275.0).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.250,
        0.900,
        curve: Curves.easeIn,
      ),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final date = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: entryAppBar(context, date),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 350),
                width: _leftAnimation.value,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 250,
                  height: 540,
                  decoration: SoftUi.boxDecoration(context),
                  child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Opacity(
                        opacity: _leftOpactiyAnimation.value,
                        child: Stack(
                          children: [
                            calendarHours(context),
                            Padding(
                              padding: EdgeInsets.only(left: 55, top: 18),
                              child: Container(
                                width: 150,
                                height: 864,
                                child: recordedActivities(context, 864, date),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 200, top: 3),
                              child: Container(
                                width: 150,
                                height: 894,
                                child: recordedOutcomes(context, 894, date),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 350),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                width: _rightAnimation.value,
                height: 540,
                decoration: SoftUi.boxDecoration(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: eventOptions(context, date),
                    ),
                    IconButton(
                      onPressed: () {
                        if (editActivityOptions == false) {
                          _controller.forward();
                          editActivityOptions = !editActivityOptions;
                        } else {
                          _controller.reverse();
                          editActivityOptions = !editActivityOptions;
                        }
                      },
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
