import 'dart:convert';

class SoccerMatch {
  final int id;
  final String date;
  final String leagueName;
  final String country;
  final String leagueLogo;
  //final String countryFlag;
  final String season;
  final String round;
  final dynamic homeTeamId;
  final String homeTeam;
  final String homeTeamLogo;

  final String awayTeam;
  final String awayTeamLogo;
  final dynamic awayTeamId;
  final dynamic homeTeamGoals;
  final dynamic awayTeamGoals;
  //final String halftimeScore;
  final dynamic status;

  final List<MatchEvent> matchEvent;

  SoccerMatch({
    required this.id,
    required this.date,
    required this.leagueName,
    required this.country,
    required this.leagueLogo,
    //required this.countryFlag,
    required this.season,
    required this.round,
    required this.homeTeamId,
    required this.homeTeam,
    required this.homeTeamLogo,
    required this.awayTeamId,
    required this.awayTeam,
    required this.awayTeamLogo,
    required this.homeTeamGoals,
    required this.awayTeamGoals,
    //required this.halftimeScore,
    required this.status,
    required this.matchEvent,
  });

  factory SoccerMatch.fromJson(Map<String, dynamic> json) {
    final fixture = json['fixture'];
    final league = json['league'];
    final teams = json['teams'];
    final goals = json['goals'];
    final score = json['score'];

    return SoccerMatch(
      id: fixture['id'],
      date: fixture['date'],
      leagueName: league['name'],
      country: league['country'],
      leagueLogo: league['logo'],

      season: league['season'].toString(),
      round: league['round'],
      homeTeamId: teams['home']['id'],
      homeTeam: teams['home']['name'],
      homeTeamLogo: teams['home']['logo'],
      awayTeamId: teams['away']['id'],
      awayTeam: teams['away']['name'],
      awayTeamLogo: teams['away']['logo'],

      homeTeamGoals: goals['home'],
      awayTeamGoals: goals['away'],
      //halftimeScore:
      //  '${score['halftime']['home']}-${score['halftime']['away']}',
      status: fixture['status']['elapsed'],
      matchEvent: (json['events'] as List)
          .map((dynamic event) => MatchEvent.fromJson(event))
          .toList(),
    );
  }
}

class MatchEvent {
  final dynamic elapsed;
  final dynamic teamName;
  final dynamic teamLogo;
  final dynamic player;
  final dynamic assist;
  final dynamic type;
  final dynamic detail;

  MatchEvent({
    required this.elapsed,
    required this.teamName,
    required this.teamLogo,
    required this.player,
    required this.assist,
    required this.type,
    required this.detail,
  });

  factory MatchEvent.fromJson(Map<String, dynamic> json) {
    final team = json['team'];
    final player = json['player'];
    final assist = json['assist'];

    return MatchEvent(
      elapsed: json['time']['elapsed'],
      teamName: team['name'],
      teamLogo: team['logo'],
      player: player['name'],
      assist: assist['name'],
      type: json['type'],
      detail: json['detail'],
    );
  }
}
