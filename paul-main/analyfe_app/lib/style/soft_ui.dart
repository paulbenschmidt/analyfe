import 'package:flutter/material.dart';

class SoftUi {
  static BoxDecoration boxDecoration(context) {
    return BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).dividerColor,
          offset: Offset(3.5, 3.5),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Theme.of(context).highlightColor,
          offset: Offset(-3.5, -3.5),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
      ],
    );
  }
}
