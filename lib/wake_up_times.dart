import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:duration/duration.dart';

const int numOfCycle = 7;
const int fallAsleepMinute = 14;
const int cycleLengthMinute = 90;
final Duration fallAsleep = new Duration(minutes: fallAsleepMinute);
final Duration cycleLength = new Duration(minutes: cycleLengthMinute);

class WakeUpTimes extends StatelessWidget {
  WakeUpTimes(this.goToBedTime);
  final DateTime goToBedTime;

  @override
  Widget build(BuildContext context) {
    DateTime time = this.goToBedTime.add(fallAsleep);
    List<Widget> times = new List<Widget>();
    for (int i = 1; i <= numOfCycle; i++) {
      time = time.add(cycleLength);
      String timeAsString = new DateFormat.Hm().format(time);
      Duration napFor =
          new Duration(minutes: i * cycleLengthMinute + fallAsleepMinute);
      String napForAsString = prettyDuration(napFor);
      times.add(new ListTile(
        title: new Text(timeAsString),
        subtitle: new Column(
          children: <Widget>[
            new Text('Nap for $napForAsString.'),
            new Text('$i cycle(s).'),
          ],
        ),
        trailing: new IconButton(
          icon: new Icon(Icons.add_alarm),
          onPressed: () {
            // TODO
            print('Set up alarm for $timeAsString');
          },
        ),
      ));

      // Put divider between `ListTile`s.
      times.add(new Divider());
    }
    // Remove divider after last `ListTile` (which is last item in `times`). The divider is not needed because there is no more item after it.
    times.removeLast();

    return new Expanded(
      child: new ListView(
        shrinkWrap: true,
        children: times,
      ),
    );
  }
}
