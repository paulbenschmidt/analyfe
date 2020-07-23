import 'package:flutter/material.dart';

import '../widgets/graphing/line_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  static const routeName = '/analytics';

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int i = 0;
  List switchGraph = ['daily', 'weekly', 'monthly', 'YTD'];
  String graphType = 'daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10), child: grapher(graphType)),
            Center(
              child: FlatButton(
                child: Text('Switch Graph'),
                onPressed: () {
                  setState(() {
                    i++;
                    if (i >= switchGraph.length) {
                      i = 0;
                    }
                    graphType = switchGraph[i];
                    //print(switchGraph[i]);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
