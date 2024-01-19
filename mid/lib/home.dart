import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mid/model.dart';
import 'package:flutter/material.dart';
import 'package:mid/goal.dart';
import 'package:mid/matchtile.dart';
import 'package:mid/teamstat.dart';
import 'package:mid/league.dart';
import 'package:mid/sPage.dart';
import 'package:mid/model.dart';
import 'package:mid/players.dart';
import 'package:flutter/services.dart';
import 'package:mid/page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late List<SoccerMatch> matches = [];
  bool f = true;
  var i;

  static const headers = {
    'X-RapidAPI-Key': '307c949e43msh334d2966ef68a90p126fe2jsncf74f337b32d',
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
  };
  Future<List<SoccerMatch>> getAllMatches() async {
    //final url = Uri.parse(
    // 'https://api-football-v1.p.rapidapi.com/v3/fixtures?=&live=all');
     //final res = await http.get(url, headers: headers);

    //final jsonData = jsonDecode(res.body);
    final String response = await rootBundle.loadString('assets/dataa.json');

    final jsonData = jsonDecode(response);

    final List<dynamic> responseList = jsonData['response'];
    //print("..number of items ${responseList.length}");

    matches =
        responseList.map((dynamic item) => SoccerMatch.fromJson(item)).toList();

    if (matches.isNotEmpty) {
      print("..number of items ${matches.length}");
      return matches;
    } else {
      return throw Exception("Unwanted Data");
    }
  }
   dynamic currentTime = 0;
Timer? timer;

  @override
  void initState() {
    super.initState();
     getAllMatches();
     //matches[i].status;
    // Start the timer when the widget is initialized
    timer = Timer.periodic(Duration(minutes: 1), (Timer t) {
      setState(() {
        //currentTime = matches[i].status;
        matches[i].status;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    if (f == true) {
      i = 0;
      //print(i);
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 16, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 16, 90),
        //elevation: 0.0,
        title: Text(
          "Live ScoreBoard",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder(
        future: getAllMatches(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            //print((snapshot.data!).length);
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: leagueStat(
                      snapshot.data![i].leagueName,
                      snapshot.data![i].leagueLogo,
                      snapshot.data![i].country,
                      snapshot.data![i].season),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Color.fromARGB(255, 63, 16, 90),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 23.0,
                          ),
                          teamStat(
                              "Local Team",
                              snapshot.data![i].homeTeamLogo,
                              snapshot.data![i].homeTeam,
                              snapshot.data![i].homeTeamId,
                              context),
                          goalStat(
                              snapshot.data![i].status,
                              snapshot.data![i].homeTeamGoals,
                              snapshot.data![i].awayTeamGoals,
                              snapshot.data![i].date),
                          teamStat(
                              "Visitor Team",
                              snapshot.data![i].awayTeamLogo,
                              snapshot.data![i].awayTeam,
                              snapshot.data![i].awayTeamId,
                              context),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 19),
                      child: SizedBox(
                        width: 150,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PageBody(snapshot.data!, i),
                              ),
                            );
                          },
                          child: Text(
                            "Events",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 63, 16, 90)),
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 251, 251, 251)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 19),
                      child: SizedBox(
                        width: 150,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sPageBody(
                                    snapshot.data!, i, snapshot.data![i].id),
                              ),
                            );
                          },
                          child: Text(
                            "Stats",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 63, 16, 90)),
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 251, 251, 251)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
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
                          Text(
                            "MATCHES",
                            style: TextStyle(
                              color: Color.fromARGB(255, 63, 16, 90),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = index;
                                        print(i);
                                        //print(f);
                                        f = false;
                                        //print(f);
                                      });
                                    },
                                    child: matchTile(snapshot.data![index]));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}
