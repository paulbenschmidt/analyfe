import 'package:flutter/material.dart';

import './init.dart';
import './home_page.dart';

void main() => runApp(ActvityApp());

class ActvityApp extends StatefulWidget {
  @override
  _ActvityAppState createState() => _ActvityAppState();
}

class _ActvityAppState extends State<ActvityApp> {
  final Future _init = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Log',
      home: FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
