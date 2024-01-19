import 'dart:ffi';
import 'package:mid/players.dart';

import 'package:flutter/material.dart';

Widget teamStat(String team, String logoUrl, String teamName, dynamic teamId, BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        SizedBox(
          width: 140,
          child: Text(
            team,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PlayerBody(teamId),));
          },
          child: Image.network(
            logoUrl,
            width: 50.0,
          ),
        ),
        
        SizedBox(
          height: 10.0,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
