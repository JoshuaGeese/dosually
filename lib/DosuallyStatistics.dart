

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> entries = <String>['A','B','C'];
final List<int> colorCodes = <int>[600,500,100];

class DosuallyStatistics extends StatefulWidget {
  @override
  _DosuallyStatisticsState createState() => _DosuallyStatisticsState();
}

class _DosuallyStatisticsState extends State<DosuallyStatistics> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Card(
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Statistics',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

