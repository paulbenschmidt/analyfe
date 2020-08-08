import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../auxiliary/dummydata.dart';
import '../graphing/line_chart.dart';
import '../graphing/data_line_graph.dart';

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
    List<FlSpot> data = linearData(outcomeList, graphType);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10), child: grapher(data, graphType)),
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
                  });
                },
              ),
            ),
            //
            //
            //
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: _buildPanel(),
                ),
              ),
            ),

            //
            //
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          for (int j = 0; j < activityList.length; j++)
            _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<String> activityList = [
  'Sleep',
  'Meditation',
  'Exercise',
  'Running',
  'Swimming',
  'Eating',
  'Tomato',
  'Party banana cake',
  'Hot dogs and butter',
];

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

int numberOfItems = activityList.length;

List<Item> _data = List.generate(
  numberOfItems,
  (int index) {
    return Item(
      headerValue: activityList[index],
      expandedValue: 'This is item number $index',
    );
  },
);
