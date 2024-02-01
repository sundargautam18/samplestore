import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesCounter extends StatefulWidget {
  final int seconds;
  final void Function() onFinished;

  SalesCounter({
    Key? key,
    required this.seconds,
    required this.onFinished,
  }) : super(key: key);

  @override
  _SalesCounterState createState() => _SalesCounterState();
}

class _SalesCounterState extends State<SalesCounter> {
  late Timer _timer;
  late int _timeInSeconds;

  @override
  void initState() {
    super.initState();
    _timeInSeconds = widget.seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_timeInSeconds < 1) {
        timer.cancel();
        widget.onFinished();
      } else {
        setState(() {
          _timeInSeconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int days = _timeInSeconds ~/ (24 * 3600);
    int hours = (_timeInSeconds ~/ 3600) % 24;
    int minutes = (_timeInSeconds ~/ 60) % 60;
    int seconds = _timeInSeconds % 60;

    return SizedBox(
      width: 100.sw,
      child: days > 0
          ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              generateCounterBlock(days, "days"),
              5.horizontalSpace,
              generateCounterBlock(hours, "hr"),
              5.horizontalSpace,
              generateCounterBlock(minutes, "min"),
              5.horizontalSpace,
              generateCounterBlock(seconds, "sec"),
            ])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                generateCounterBlock(hours, "hr"),
                5.horizontalSpace,
                generateCounterBlock(minutes, "min"),
                5.horizontalSpace,
                generateCounterBlock(seconds, "sec"),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget generateCounterBlock(int counter, String title) {
    return Container(
   
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white, ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$counter",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            2.horizontalSpace,
            Text(title)
          ],
        ),
      ),
    );
  }
}
