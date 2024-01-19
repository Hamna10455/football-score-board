import 'package:flutter/material.dart';

Widget goalStat(dynamic expandedTime, dynamic homeGoal, dynamic awayGoal, dynamic date) {
  dynamic home = homeGoal;
  dynamic away = awayGoal;
  dynamic elapsed = expandedTime;
  var matchdate = date;
  if (home == null) home = 0;
  if (away == null) away = 0;
  if (elapsed == null) elapsed = 0;
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${date}",
          maxLines: 1,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            letterSpacing: 3.2,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${home} - ${away}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          "${elapsed}'",
          
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
