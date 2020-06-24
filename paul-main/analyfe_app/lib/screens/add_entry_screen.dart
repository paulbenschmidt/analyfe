import 'package:flutter/material.dart';

import '../style/soft_ui.dart';

class AddEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Sleep',
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
                            style: TextStyle(fontSize: 40),
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
                decoration: SoftUi.boxDecoration(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
