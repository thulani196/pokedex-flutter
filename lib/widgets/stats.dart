import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/helpers.dart';

class Stats extends StatelessWidget {
  final String name;
  final int statValue;

  const Stats({
    Key? key,
    required this.name,
    required this.statValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 16.0),
                text: name,
                children: <TextSpan>[
                  TextSpan(
                      text: '  $statValue',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              padding: const EdgeInsets.all(0),
              lineHeight: 8.0,
              percent: getPercentage(statValue),
              progressColor: getColor(statValue),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(int value) {
    if (value >= 80) {
      return Colors.green;
    } else if (value >= 60) {
      return Colors.cyan;
    } else if (value >= 40) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }
}
