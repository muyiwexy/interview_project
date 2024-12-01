// ignore_for_file: constant_identifier_names
// Enum declarations remain the same
enum IncidentType {
  PERIOD,
  PENALTY_SHOOTOUT,
  INJURY_TIME,
  SUBSTITUTION,
  CARD,
  GOAL,
}

final incidentTypeValues = EnumValues({
  "period": IncidentType.PERIOD,
  "penaltyShootout": IncidentType.PENALTY_SHOOTOUT,
  "injuryTime": IncidentType.INJURY_TIME,
  "substitution": IncidentType.SUBSTITUTION,
  "card": IncidentType.CARD,
  "goal": IncidentType.GOAL,
});

enum IncidentClass {
  SCORED,
  MISSED,
  REGULAR,
  INJURY,
  YELLOW,
  RED,
}

final incidentClassValues = EnumValues({
  "scored": IncidentClass.SCORED,
  "missed": IncidentClass.MISSED,
  "regular": IncidentClass.REGULAR,
  "injury": IncidentClass.INJURY,
  "yellow": IncidentClass.YELLOW,
  "red": IncidentClass.RED,
});

enum Reason {
  FOUL,
  GOALKEEPER_SAVE,
  SCORED,
}

final reasonValues = EnumValues({
  "Foul": Reason.FOUL,
  "goalkeeperSave": Reason.GOALKEEPER_SAVE,
  "scored": Reason.SCORED,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// Model Classes
class ProposedMarketValueRaw {
  final int? value;
  final String? currency;

  ProposedMarketValueRaw({
    this.value,
    this.currency,
  });

  factory ProposedMarketValueRaw.fromJson(Map<String, dynamic> json) {
    return ProposedMarketValueRaw(
      value: json['value'],
      currency: json['currency'],
    );
  }
}

class Translation {
  final String? ar;

  Translation({this.ar});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      ar: json['ar'],
    );
  }
}

class FieldTranslations {
  final Translation? nameTranslation;
  final Translation? shortNameTranslation;

  FieldTranslations({
    this.nameTranslation,
    this.shortNameTranslation,
  });

  factory FieldTranslations.fromJson(Map<String, dynamic> json) {
    return FieldTranslations(
      nameTranslation: json.containsKey('nameTranslation')
          ? Translation.fromJson(json['nameTranslation'])
          : null,
      shortNameTranslation: json.containsKey('shortNameTranslation')
          ? Translation.fromJson(json['shortNameTranslation'])
          : null,
    );
  }
}

class Player {
  final String? name;
  final String? slug;
  final String? shortName;
  final String? position;
  final String? jerseyNumber;
  final int? height;
  final int? userCount;
  final int? id;
  final String? marketValueCurrency;
  final int? dateOfBirthTimestamp;
  final ProposedMarketValueRaw? proposedMarketValueRaw;
  final FieldTranslations? fieldTranslations;

  Player({
    this.name,
    this.slug,
    this.shortName,
    this.position,
    this.jerseyNumber,
    this.height,
    this.userCount,
    this.id,
    this.marketValueCurrency,
    this.dateOfBirthTimestamp,
    this.proposedMarketValueRaw,
    this.fieldTranslations,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      slug: json['slug'],
      shortName: json['shortName'],
      position: json['position'],
      jerseyNumber: json['jerseyNumber'],
      height: json['height'],
      userCount: json['userCount'],
      id: json['id'],
      marketValueCurrency: json['marketValueCurrency'],
      dateOfBirthTimestamp: json['dateOfBirthTimestamp'],
      proposedMarketValueRaw: json.containsKey('proposedMarketValueRaw')
          ? ProposedMarketValueRaw.fromJson(json['proposedMarketValueRaw'])
          : null,
      fieldTranslations: json.containsKey('fieldTranslations')
          ? FieldTranslations.fromJson(json['fieldTranslations'])
          : null,
    );
  }
}

class ColorDetail {
  final String? primary;
  final String? number;
  final String? outline;
  final String? fancyNumber;

  ColorDetail({
    this.primary,
    this.number,
    this.outline,
    this.fancyNumber,
  });

  factory ColorDetail.fromJson(Map<String, dynamic> json) {
    return ColorDetail(
      primary: json['primary'],
      number: json['number'],
      outline: json['outline'],
      fancyNumber: json['fancyNumber'],
    );
  }
}

class TeamColor {
  final ColorDetail? goalkeeperColor;
  final ColorDetail? playerColor;

  TeamColor({
    this.goalkeeperColor,
    this.playerColor,
  });

  factory TeamColor.fromJson(Map<String, dynamic> json) {
    return TeamColor(
      goalkeeperColor: json.containsKey('goalkeeperColor')
          ? ColorDetail.fromJson(json['goalkeeperColor'])
          : null,
      playerColor: json.containsKey('playerColor')
          ? ColorDetail.fromJson(json['playerColor'])
          : null,
    );
  }
}

class Incident {
  final String? text;
  final int? homeScore;
  final int? awayScore;
  final bool? isLive;
  final int? time;
  final int? addedTime;
  final int? timeSeconds;
  final int? reversedPeriodTime;
  final int? reversedPeriodTimeSeconds;
  final IncidentType? incidentType;
  final Player? player;
  final int? sequence;
  final String? description;
  final int? id;
  final bool? isHome;
  final IncidentClass? incidentClass;
  final String? reason;
  final int? length;
  final Player? playerIn;
  final Player? playerOut;
  final bool? injury;
  final bool? rescinded;

  Incident({
    this.text,
    this.homeScore,
    this.awayScore,
    this.isLive,
    this.time,
    this.addedTime,
    this.timeSeconds,
    this.reversedPeriodTime,
    this.reversedPeriodTimeSeconds,
    this.incidentType,
    this.player,
    this.sequence,
    this.description,
    this.id,
    this.isHome,
    this.incidentClass,
    this.reason,
    this.length,
    this.playerIn,
    this.playerOut,
    this.injury,
    this.rescinded,
  });

  factory Incident.fromJson(Map<String, dynamic> json) {
    return Incident(
      text: json['text'],
      homeScore: json['homeScore'],
      awayScore: json['awayScore'],
      isLive: json['isLive'],
      time: json['time'],
      addedTime: json['addedTime'],
      timeSeconds: json['timeSeconds'],
      reversedPeriodTime: json['reversedPeriodTime'],
      reversedPeriodTimeSeconds: json['reversedPeriodTimeSeconds'],
      incidentType: json['incidentType'] != null
          ? incidentTypeValues.map[json['incidentType']]
          : null,
      player:
          json.containsKey('player') ? Player.fromJson(json['player']) : null,
      sequence: json['sequence'],
      description: json['description'],
      id: json['id'],
      isHome: json['isHome'],
      incidentClass: json['incidentClass'] != null
          ? incidentClassValues.map[json['incidentClass']]
          : null,
      reason: json['reason'],
      length: json['length'],
      playerIn: json.containsKey('playerIn')
          ? Player.fromJson(json['playerIn'])
          : null,
      playerOut: json.containsKey('playerOut')
          ? Player.fromJson(json['playerOut'])
          : null,
      injury: json['injury'],
      rescinded: json['rescinded'],
    );
  }
}

class Data {
  final List<Incident>? incidents;
  final TeamColor? home;
  final TeamColor? away;

  Data({
    this.incidents,
    this.home,
    this.away,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      incidents: json.containsKey('incidents')
          ? (json['incidents'] as List<dynamic>)
              .map((e) => Incident.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      home: json.containsKey('home') ? TeamColor.fromJson(json['home']) : null,
      away: json.containsKey('away') ? TeamColor.fromJson(json['away']) : null,
    );
  }
}

class RootIncident {
  final bool? success;
  final Data? data;

  RootIncident({
    this.success,
    this.data,
  });

  factory RootIncident.fromJson(Map<String, dynamic> json) {
    return RootIncident(
      success: json['success'],
      data: json.containsKey('data') ? Data.fromJson(json['data']) : null,
    );
  }
}
