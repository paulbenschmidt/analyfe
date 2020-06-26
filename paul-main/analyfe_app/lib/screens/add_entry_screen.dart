import 'package:flutter/material.dart';

import '../style/soft_ui.dart';

class AddEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
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
                ),
                Text(
                  'Entry',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: Icon(Icons.save_alt),
                  ),
                  decoration: SoftUi.boxDecoration(context),
                ),
              ],
            ),
            preferredSize: null,
          ),
        ),
      ),
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
                decoration: SoftUi.boxDecoration(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
