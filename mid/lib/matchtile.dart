import 'package:flutter/material.dart';
import 'model.dart';

Widget matchTile(SoccerMatch match) {
  var homeGoal = match.homeTeamGoals;
  var awayGoal = match.awayTeamGoals;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 10,
    ),
    height: 100.0,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 254, 255, 254),
      border: Border.all(
        width: 1.6,
        color: Color.fromARGB(255, 234, 234, 234),
      ),
      borderRadius: BorderRadius.circular(7),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  match.homeTeamLogo,
                  width: 55.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                match.homeTeam,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 16, 90),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            "${homeGoal} - ${awayGoal}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 63, 16, 90),
              fontSize: 33.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  match.awayTeamLogo,
                  width: 55.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                match.awayTeam,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 16, 90),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
