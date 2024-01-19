import 'package:flutter/material.dart';
import 'package:mid/goal.dart';
import 'package:mid/matchtile.dart';
import 'package:mid/teamstat.dart';
import 'model.dart';
import 'package:mid/statbody.dart';
import 'package:mid/model.dart';
import 'package:mid/stat_model.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class sPageBody extends StatefulWidget {
  List<SoccerMatch> allmatches;
  int i;
  int id;
  sPageBody(this.allmatches, this.i, this.id);

  @override
  State<sPageBody> createState() => _sPageBody(allmatches, i, id);
}

class _sPageBody extends State<sPageBody> {
  List<SoccerMatch> allmatches;
  int i;
  int id;
  _sPageBody(this.allmatches, this.i, this.id);
  static const headers = {
    'X-RapidAPI-Key': '307c949e43msh334d2966ef68a90p126fe2jsncf74f337b32d',
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
  };
  Future<List<FixtureStatistics>> getFixtureStatistics() async {
    id = allmatches[i].id;
    
      final url = Uri.parse(
          'https://api-football-v1.p.rapidapi.com/v3/fixtures/statistics?fixture=$id');
      final res = await http.get(url, headers: headers);

      final jsonData = jsonDecode(res.body);
      //final String file = await rootBundle.loadString('assets/end$id.json');

      //final jsonData = json.decode(file);

      final List<dynamic> responseList = jsonData['response'];
      final List<FixtureStatistics> fixtureStatisticsList = responseList
          .map((fixtureData) => FixtureStatistics.fromJson(fixtureData))
          .toList();

    if (fixtureStatisticsList.length>0) {
      print("..number of fixtureeeeeeee ${fixtureStatisticsList.length}");
      return fixtureStatisticsList;
    } else {
      print("..number of fixtureeeeeeee ${fixtureStatisticsList.length}");
      
      return throw Exception("No Data");
    }
  }

    void initState() {
    super.initState();
    // Call the readJson method when the app starts
    getFixtureStatistics();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 11, 62),
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Stats",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            backgroundColor: Color.fromARGB(255, 63, 16, 90),
            centerTitle: true,
          ),
          SizedBox(
            height: 59,
            width: 400,
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
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Year ${allmatches[i].season}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
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
                    teamStat(
                        "Local Team",
                        allmatches[i].homeTeamLogo,
                        allmatches[i].homeTeam,
                        allmatches[i].homeTeamId,
                        context),
                    goalStat(allmatches[i].status, allmatches[i].homeTeamGoals,
                        allmatches[i].awayTeamGoals, allmatches[i].date),
                    teamStat(
                        "Visitor Team",
                        allmatches[i].awayTeamLogo,
                        allmatches[i].awayTeam,
                        allmatches[i].awayTeamId,
                        context),
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
                            Image.network(
                              allmatches[i].homeTeamLogo,
                              width: 40.0,
                            ),
                            SizedBox(
                              width: 65.0,
                            ),
                            Text(
                              "TEAM STATS",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            Image.network(
                              allmatches[i].awayTeamLogo,
                              width: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                   
                      child: FutureBuilder<List<FixtureStatistics>>(
                        future: getFixtureStatistics(),
                        builder: (context, snapshot) {
                          //the future builder is very intersting to use when you work with api

                          if (snapshot.hasData) {
                            print(snapshot.data!.length);

                            return StatBody(snapshot.data![0].statistics,
                                snapshot.data![1].statistics);
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return const Center(
                              child: CircularProgressIndicator());
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
