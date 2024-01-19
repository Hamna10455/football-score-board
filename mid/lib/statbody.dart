import 'package:flutter/material.dart';
import 'package:mid/goal.dart';
import 'package:mid/matchtile.dart';
import 'package:mid/teamstat.dart';
import 'package:mid/stat_model.dart';

Widget StatBody(List<Statistic> allmatches, List<Statistic> teamTwo) {
  return ListView.builder(
    itemCount: allmatches.length,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
        height:50.0,
        decoration: BoxDecoration(
          //color: Color.fromARGB(255, 112, 228, 112),
          border: Border.all(
            width: 1.6,
            color: Color.fromARGB(255, 43, 11, 62),
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
                  
                  Text(
                    "${allmatches[index].value}",
                    
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(width: 80,),
            Expanded(
              flex: 4,
              child: Text(
                "${allmatches[index].type}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500
             
                ),
              ),
            ),//SizedBox(width: 80,),
            Expanded(
              child: Column(
                children: [
                  
  
                  Text(
                   "${teamTwo[index].value}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
