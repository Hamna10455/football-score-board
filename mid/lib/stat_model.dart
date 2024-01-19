class FixtureStatistics {
  final dynamic teamId;
  final dynamic teamName;
  final dynamic teamLogo;
  final List<Statistic> statistics;

  FixtureStatistics({
    required this.teamId,
    required this.teamName,
    required this.teamLogo,
    required this.statistics,
  });

  factory FixtureStatistics.fromJson(Map<String, dynamic> json) {
    return FixtureStatistics(
      teamId: json['team']['id'].toString(),
      teamName: json['team']['name'],
      teamLogo: json['team']['logo'],
      statistics: (json['statistics'] as List)
          .map((statistic) => Statistic.fromJson(statistic))
          .toList(),
    );
  }
}

class Statistic {
  final dynamic type;
  final dynamic value;

  Statistic({
    required this.type,
    required this.value,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      type: json['type'],
      value: json['value'],
    );
  }
}