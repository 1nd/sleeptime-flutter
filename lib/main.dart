import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'wake_up_times.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTime goToBedTime = new DateTime.now();
    final String goToBedAt = new DateFormat.Hm().format(goToBedTime);
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Sleep Time'),
        ),
        body: new Column(
          children: <Widget>[
            new Text('If you go to bed at $goToBedAt,'),
            new Text('you should wake up at'),
            new WakeUpTimes(goToBedTime),
          ],
        ),
      ),
    );
  }
}
