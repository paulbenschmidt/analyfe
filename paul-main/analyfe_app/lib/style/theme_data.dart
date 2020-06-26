import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData(
  primarySwatch: Colors.pink,
  accentColor: Colors.amber,
  backgroundColor: Colors.grey[200],
  highlightColor: Colors.grey[400],
  dividerColor: Colors.white,
  textTheme: ThemeData.light().textTheme.copyWith(
        headline1: TextStyle(
          color: Colors.blueGrey[700],
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.blueGrey[700],
          fontSize: 25,
        ),
      ),
);

// TextTheme _buildDefaultTextTheme(TextTheme base) {
//   return base.copyWith(
//     headline: base.headline.copyWith(
//       fontWeight: FontWeight.w500,
//     ),
//     title: base.title.copyWith(
//       color: Colors.black,
//       fontWeight: FontWeight.w700,
//       fontSize: 30.0,
//     ),
//     caption: base.caption.copyWith(
//       fontWeight: FontWeight.w400,
//       fontSize: 14.0,
//     ),
//     body2: base.body2.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 16.0,
//     ),
//   );
// }

// ThemeData(
//         primarySwatch: Colors.pink,
//         accentColor: Colors.amber,
//         backgroundColor: Colors.grey[200],
//         highlightColor: Colors.grey[400],
//         dividerColor: Colors.white,
//         textTheme: ThemeData.light().textTheme.copyWith(
//               headline1: TextStyle(
//                 color: Colors.blueGrey[700],
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 25,
//               ),
//               bodyText1: TextStyle(
//                 fontFamily: 'Montserrat',
//                 color: Colors.blueGrey[700],
//                 fontSize: 25,
//               ),
//             ),
//       ),

// import 'package:flutter/material.dart';

// final ThemeData defaultTheme = _buildDefaultTheme();

// ThemeData _buildDefaultTheme() {
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//     textTheme: _buildDefaultTextTheme(base.textTheme),
//     primaryTextTheme: _buildDefaultTextTheme(base.primaryTextTheme),
//     accentTextTheme: _buildDefaultTextTheme(base.accentTextTheme),
//   );
// }

// TextTheme _buildDefaultTextTheme(TextTheme base) {
//   return base.copyWith(
//     headline: base.headline.copyWith(
//       fontWeight: FontWeight.w500,
//     ),
//     title: base.title.copyWith(
//       color: Colors.black,
//       fontWeight: FontWeight.w700,
//       fontSize: 30.0,
//     ),
//     caption: base.caption.copyWith(
//       fontWeight: FontWeight.w400,
//       fontSize: 14.0,
//     ),
//     body2: base.body2.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 16.0,
//     ),
//   );
// }
