import 'package:flutter/material.dart';

import '../../models/outcome.dart';

class OutcomeRecords with ChangeNotifier {
  List<Outcome> _outcomeRecords = [];

  List<Outcome> get records {
    return [..._outcomeRecords];
  }

  void addOutcomeEntry(newOutcomeEntry) {
    _outcomeRecords.add(newOutcomeEntry);
    notifyListeners();
  }
}
