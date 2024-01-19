import 'package:flutter/material.dart';
import 'package:mid/goal.dart';
import 'package:mid/matchtile.dart';
import 'package:mid/teamstat.dart';
import 'model.dart';
import 'package:mid/eventtile.dart';
import 'package:mid/model.dart';
import 'package:mid/stat_model.dart';
//import 'package:mid/api.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class PageBody extends StatefulWidget {
  List<SoccerMatch> allmatches;
  int i;

  PageBody(this.allmatches, this.i);

  @override
  State<PageBody> createState() => _PageBody(allmatches, i);
}

class _PageBody extends State<PageBody> {
  List<SoccerMatch> allmatches;
  int i;
  int id = 0;
  _PageBody(this.allmatches, this.i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Events",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            backgroundColor: Color.fromARGB(255, 63, 16, 90),
            centerTitle: true,
          ),
          SizedBox(
            height: 55,
            width: 340,
            //padding: EdgeInsets.only(top: 0),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  allmatches[i].leagueName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 16, 90),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Year ${allmatches[i].season}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 16, 90),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color.fromARGB(255, 63, 16, 90),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    teamStat("Local Team", allmatches[i].homeTeamLogo,
                        allmatches[i].homeTeam, allmatches[i].homeTeamId, context),
                    goalStat(allmatches[i].status, allmatches[i].homeTeamGoals,
                        allmatches[i].awayTeamGoals, allmatches[i].date),
                    teamStat("Visitor Team", allmatches[i].awayTeamLogo,
                        allmatches[i].awayTeam, allmatches[i].awayTeamId, context),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 63, 16, 90),
                borderRadius: BorderRadius.only(
                    //topLeft: Radius.circular(40.0),
                    //topRight: Radius.circular(40.0),
                    ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //color: Color.fromARGB(255, 63, 16, 90),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "TEAM EVENTS",
                              style: TextStyle(
                                color: Color.fromARGB(255, 43, 11, 62),
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: allmatches[i].matchEvent.length,
                        itemBuilder: (context, index) {
                          return eventTile(allmatches[i].matchEvent[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
