import 'package:flutter/material.dart';
import 'package:mid/team.dart';
import 'package:mid/matchtile.dart';
import 'package:mid/teamstat.dart';
import 'model.dart';
import 'package:mid/eventtile.dart';
import 'package:mid/playerlist.dart';
import 'package:mid/teamModel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerBody extends StatefulWidget {
  int id;

  PlayerBody(this.id);

  @override
  State<PlayerBody> createState() => _PlayerBody(id);
}

class _PlayerBody extends State<PlayerBody> {
  int tid;
  _PlayerBody(this.tid);

  static const headers = {
    'X-RapidAPI-Key': '307c949e43msh334d2966ef68a90p126fe2jsncf74f337b32d',
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
  };
  late List<Team> players = [];
  Future<List<Team>> getAllPlayers() async {
    final url = Uri.parse(
        'https://api-football-v1.p.rapidapi.com/v3/players/squads?team=$tid');
    final res = await http.get(url, headers: headers);

    final jsonData = jsonDecode(res.body);

    final List<dynamic> responseList = jsonData['response'];

    players = responseList.map((dynamic item) => Team.fromJson(item)).toList();

    if (players.isNotEmpty) {
      print("..number of items ${players.length}");
      print(players[0].name);
      print(players[0].players[0].name);
      return players;
    } else {
      return throw Exception("Unwanted Data");
    }
  }

  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    getAllPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "Players",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Color.fromARGB(255, 63, 16, 90),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAllPlayers(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            //print((snapshot.data!).length);
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: leagueStat(snapshot.data![0].name,
                      snapshot.data![0].logo, snapshot.data![0].id),
                ),
                Expanded(
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
                         
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data![0].players.length,
                              itemBuilder: (context, index) {
                                return  playerList(
                                      snapshot.data![0].players[index].name,
                                      snapshot.data![0].players[index].photo,
                                      snapshot.data![0].players[index].position,
                                      snapshot.data![0].players[index].age,
                                      );
                                
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
