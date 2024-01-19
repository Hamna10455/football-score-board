class Team {
  dynamic id;
  dynamic name;
  dynamic logo;
  List<Player> players;

  Team({
    required this.id,
    required this.name,
    required this.logo,
    required this.players,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['team']['id'],
      name: json['team']['name'],
      logo: json['team']['logo'],
      players: List<Player>.from(json['players'].map((player) => Player.fromJson(player))),
    );
  }
}

class Player {
  dynamic id;
  dynamic name;
  dynamic age;
  dynamic number;
  dynamic position;
  dynamic photo;

  Player({
    required this.id,
    required this.name,
    required this.age,
    required this.number,
    required this.position,
    required this.photo,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      number: json['number'],
      position: json['position'],
      photo: json['photo'],
    );
  }
}
