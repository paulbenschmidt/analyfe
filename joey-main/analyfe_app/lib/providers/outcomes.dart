import 'package:flutter/material.dart';

import '../models/outcome.dart';

class Outcomes with ChangeNotifier {
  List<Outcome> _outcomes = [];

  List<Outcome> get options {
    return [..._outcomes];
  }
}
