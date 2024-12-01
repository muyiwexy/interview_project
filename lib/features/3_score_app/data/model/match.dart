import 'dart:convert';

class MatchModel {
  final bool? success;
  final Data? data;

  MatchModel({
    this.success,
    this.data,
  });

  factory MatchModel.fromRawJson(String str) =>
      MatchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final Event? event;

  Data({
    this.event,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        event: json["event"] == null ? null : Event.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "event": event?.toJson(),
      };
}

class Event {
  final Tournament? tournament;
  final Season? season;
  final RoundInfo? roundInfo;
  final String? customId;
  final Status? status;
  final int? winnerCode;
  final int? aggregatedWinnerCode;
  final Venue? venue;
  final Referee? referee;
  final Team? homeTeam;
  final Team? awayTeam;
  final Score? homeScore;
  final Score? awayScore;
  final Time? time;
  final Changes? changes;
  final bool? hasGlobalHighlights;
  final bool? hasXg;
  final bool? hasEventPlayerStatistics;
  final bool? hasEventPlayerHeatMap;
  final int? detailId;
  final bool? crowdsourcingDataDisplayEnabled;
  final int? id;
  final int? defaultPeriodCount;
  final int? defaultPeriodLength;
  final int? defaultOvertimeLength;
  final int? currentPeriodStartTimestamp;
  final int? previousLegEventId;
  final int? startTimestamp;
  final String? slug;
  final bool? finalResultOnly;
  final bool? feedLocked;
  final int? cupMatchesInRound;
  final bool? fanRatingEvent;
  final String? seasonStatisticsType;
  final bool? showTotoPromo;
  final bool? isEditor;

  Event({
    this.tournament,
    this.season,
    this.roundInfo,
    this.customId,
    this.status,
    this.winnerCode,
    this.aggregatedWinnerCode,
    this.venue,
    this.referee,
    this.homeTeam,
    this.awayTeam,
    this.homeScore,
    this.awayScore,
    this.time,
    this.changes,
    this.hasGlobalHighlights,
    this.hasXg,
    this.hasEventPlayerStatistics,
    this.hasEventPlayerHeatMap,
    this.detailId,
    this.crowdsourcingDataDisplayEnabled,
    this.id,
    this.defaultPeriodCount,
    this.defaultPeriodLength,
    this.defaultOvertimeLength,
    this.currentPeriodStartTimestamp,
    this.previousLegEventId,
    this.startTimestamp,
    this.slug,
    this.finalResultOnly,
    this.feedLocked,
    this.cupMatchesInRound,
    this.fanRatingEvent,
    this.seasonStatisticsType,
    this.showTotoPromo,
    this.isEditor,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        tournament: json["tournament"] == null
            ? null
            : Tournament.fromJson(json["tournament"]),
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
        roundInfo: json["roundInfo"] == null
            ? null
            : RoundInfo.fromJson(json["roundInfo"]),
        customId: json["customId"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        winnerCode: json["winnerCode"],
        aggregatedWinnerCode: json["aggregatedWinnerCode"],
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        referee:
            json["referee"] == null ? null : Referee.fromJson(json["referee"]),
        homeTeam:
            json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
        awayTeam:
            json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
        homeScore: json["homeScore"] == null
            ? null
            : Score.fromJson(json["homeScore"]),
        awayScore: json["awayScore"] == null
            ? null
            : Score.fromJson(json["awayScore"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        changes:
            json["changes"] == null ? null : Changes.fromJson(json["changes"]),
        hasGlobalHighlights: json["hasGlobalHighlights"],
        hasXg: json["hasXg"],
        hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
        hasEventPlayerHeatMap: json["hasEventPlayerHeatMap"],
        detailId: json["detailId"],
        crowdsourcingDataDisplayEnabled:
            json["crowdsourcingDataDisplayEnabled"],
        id: json["id"],
        defaultPeriodCount: json["defaultPeriodCount"],
        defaultPeriodLength: json["defaultPeriodLength"],
        defaultOvertimeLength: json["defaultOvertimeLength"],
        currentPeriodStartTimestamp: json["currentPeriodStartTimestamp"],
        previousLegEventId: json["previousLegEventId"],
        startTimestamp: json["startTimestamp"],
        slug: json["slug"],
        finalResultOnly: json["finalResultOnly"],
        feedLocked: json["feedLocked"],
        cupMatchesInRound: json["cupMatchesInRound"],
        fanRatingEvent: json["fanRatingEvent"],
        seasonStatisticsType: json["seasonStatisticsType"],
        showTotoPromo: json["showTotoPromo"],
        isEditor: json["isEditor"],
      );

  Map<String, dynamic> toJson() => {
        "tournament": tournament?.toJson(),
        "season": season?.toJson(),
        "roundInfo": roundInfo?.toJson(),
        "customId": customId,
        "status": status?.toJson(),
        "winnerCode": winnerCode,
        "aggregatedWinnerCode": aggregatedWinnerCode,
        "venue": venue?.toJson(),
        "referee": referee?.toJson(),
        "homeTeam": homeTeam?.toJson(),
        "awayTeam": awayTeam?.toJson(),
        "homeScore": homeScore?.toJson(),
        "awayScore": awayScore?.toJson(),
        "time": time?.toJson(),
        "changes": changes?.toJson(),
        "hasGlobalHighlights": hasGlobalHighlights,
        "hasXg": hasXg,
        "hasEventPlayerStatistics": hasEventPlayerStatistics,
        "hasEventPlayerHeatMap": hasEventPlayerHeatMap,
        "detailId": detailId,
        "crowdsourcingDataDisplayEnabled": crowdsourcingDataDisplayEnabled,
        "id": id,
        "defaultPeriodCount": defaultPeriodCount,
        "defaultPeriodLength": defaultPeriodLength,
        "defaultOvertimeLength": defaultOvertimeLength,
        "currentPeriodStartTimestamp": currentPeriodStartTimestamp,
        "previousLegEventId": previousLegEventId,
        "startTimestamp": startTimestamp,
        "slug": slug,
        "finalResultOnly": finalResultOnly,
        "feedLocked": feedLocked,
        "cupMatchesInRound": cupMatchesInRound,
        "fanRatingEvent": fanRatingEvent,
        "seasonStatisticsType": seasonStatisticsType,
        "showTotoPromo": showTotoPromo,
        "isEditor": isEditor,
      };
}

class Score {
  final int? current;
  final int? display;
  final int? period1;
  final int? period2;
  final int? normaltime;
  final int? extra1;
  final int? extra2;
  final int? overtime;
  final int? penalties;
  final int? aggregated;

  Score({
    this.current,
    this.display,
    this.period1,
    this.period2,
    this.normaltime,
    this.extra1,
    this.extra2,
    this.overtime,
    this.penalties,
    this.aggregated,
  });

  factory Score.fromRawJson(String str) => Score.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        current: json["current"],
        display: json["display"],
        period1: json["period1"],
        period2: json["period2"],
        normaltime: json["normaltime"],
        extra1: json["extra1"],
        extra2: json["extra2"],
        overtime: json["overtime"],
        penalties: json["penalties"],
        aggregated: json["aggregated"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "display": display,
        "period1": period1,
        "period2": period2,
        "normaltime": normaltime,
        "extra1": extra1,
        "extra2": extra2,
        "overtime": overtime,
        "penalties": penalties,
        "aggregated": aggregated,
      };
}

class Team {
  final String? name;
  final String? slug;
  final String? shortName;
  final String? gender;
  final Sport? sport;
  final int? userCount;
  final Manager? manager;
  final Venue? venue;
  final String? nameCode;
  final int? teamClass;
  final bool? disabled;
  final bool? national;
  final int? type;
  final int? id;
  final Country? country;
  final List<dynamic>? subTeams;
  final String? fullName;
  final TeamColors? teamColors;
  final int? foundationDateTimestamp;
  final AwayTeamFieldTranslations? fieldTranslations;
  final String? logo;

  Team({
    this.name,
    this.slug,
    this.shortName,
    this.gender,
    this.sport,
    this.userCount,
    this.manager,
    this.venue,
    this.nameCode,
    this.teamClass,
    this.disabled,
    this.national,
    this.type,
    this.id,
    this.country,
    this.subTeams,
    this.fullName,
    this.teamColors,
    this.foundationDateTimestamp,
    this.fieldTranslations,
    this.logo,
  });

  factory Team.fromRawJson(String str) => Team.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        slug: json["slug"],
        shortName: json["shortName"],
        gender: json["gender"],
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        userCount: json["userCount"],
        manager:
            json["manager"] == null ? null : Manager.fromJson(json["manager"]),
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        nameCode: json["nameCode"],
        teamClass: json["class"],
        disabled: json["disabled"],
        national: json["national"],
        type: json["type"],
        id: json["id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        subTeams: json["subTeams"] == null
            ? []
            : List<dynamic>.from(json["subTeams"]!.map((x) => x)),
        fullName: json["fullName"],
        teamColors: json["teamColors"] == null
            ? null
            : TeamColors.fromJson(json["teamColors"]),
        foundationDateTimestamp: json["foundationDateTimestamp"],
        fieldTranslations: json["fieldTranslations"] == null
            ? null
            : AwayTeamFieldTranslations.fromJson(json["fieldTranslations"]),
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "shortName": shortName,
        "gender": gender,
        "sport": sport?.toJson(),
        "userCount": userCount,
        "manager": manager?.toJson(),
        "venue": venue?.toJson(),
        "nameCode": nameCode,
        "class": teamClass,
        "disabled": disabled,
        "national": national,
        "type": type,
        "id": id,
        "country": country?.toJson(),
        "subTeams":
            subTeams == null ? [] : List<dynamic>.from(subTeams!.map((x) => x)),
        "fullName": fullName,
        "teamColors": teamColors?.toJson(),
        "foundationDateTimestamp": foundationDateTimestamp,
        "fieldTranslations": fieldTranslations?.toJson(),
        "logo": logo,
      };
}

class Country {
  final String? alpha2;
  final String? alpha3;
  final String? name;
  final String? slug;

  Country({
    this.alpha2,
    this.alpha3,
    this.name,
    this.slug,
  });

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        alpha2: json["alpha2"],
        alpha3: json["alpha3"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "alpha2": alpha2,
        "alpha3": alpha3,
        "name": name,
        "slug": slug,
      };
}

class AwayTeamFieldTranslations {
  final NameTranslation? nameTranslation;
  final SeasonCoverageInfo? shortNameTranslation;

  AwayTeamFieldTranslations({
    this.nameTranslation,
    this.shortNameTranslation,
  });

  factory AwayTeamFieldTranslations.fromRawJson(String str) =>
      AwayTeamFieldTranslations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AwayTeamFieldTranslations.fromJson(Map<String, dynamic> json) =>
      AwayTeamFieldTranslations(
        nameTranslation: json["nameTranslation"] == null
            ? null
            : NameTranslation.fromJson(json["nameTranslation"]),
        shortNameTranslation: json["shortNameTranslation"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["shortNameTranslation"]),
      );

  Map<String, dynamic> toJson() => {
        "nameTranslation": nameTranslation?.toJson(),
        "shortNameTranslation": shortNameTranslation?.toJson(),
      };
}

class NameTranslation {
  final String? ar;
  final String? ru;

  NameTranslation({
    this.ar,
    this.ru,
  });

  factory NameTranslation.fromRawJson(String str) =>
      NameTranslation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NameTranslation.fromJson(Map<String, dynamic> json) =>
      NameTranslation(
        ar: json["ar"],
        ru: json["ru"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "ru": ru,
      };
}

class SeasonCoverageInfo {
  SeasonCoverageInfo();

  factory SeasonCoverageInfo.fromRawJson(String str) =>
      SeasonCoverageInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeasonCoverageInfo.fromJson(Map<String, dynamic> json) =>
      SeasonCoverageInfo();

  Map<String, dynamic> toJson() => {};
}

class Manager {
  final String? name;
  final String? slug;
  final String? shortName;
  final int? id;
  final Country? country;
  final ManagerFieldTranslations? fieldTranslations;

  Manager({
    this.name,
    this.slug,
    this.shortName,
    this.id,
    this.country,
    this.fieldTranslations,
  });

  factory Manager.fromRawJson(String str) => Manager.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        name: json["name"],
        slug: json["slug"],
        shortName: json["shortName"],
        id: json["id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        fieldTranslations: json["fieldTranslations"] == null
            ? null
            : ManagerFieldTranslations.fromJson(json["fieldTranslations"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "shortName": shortName,
        "id": id,
        "country": country?.toJson(),
        "fieldTranslations": fieldTranslations?.toJson(),
      };
}

class ManagerFieldTranslations {
  final ShortNameTranslationClass? nameTranslation;
  final ShortNameTranslationClass? shortNameTranslation;

  ManagerFieldTranslations({
    this.nameTranslation,
    this.shortNameTranslation,
  });

  factory ManagerFieldTranslations.fromRawJson(String str) =>
      ManagerFieldTranslations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ManagerFieldTranslations.fromJson(Map<String, dynamic> json) =>
      ManagerFieldTranslations(
        nameTranslation: json["nameTranslation"] == null
            ? null
            : ShortNameTranslationClass.fromJson(json["nameTranslation"]),
        shortNameTranslation: json["shortNameTranslation"] == null
            ? null
            : ShortNameTranslationClass.fromJson(json["shortNameTranslation"]),
      );

  Map<String, dynamic> toJson() => {
        "nameTranslation": nameTranslation?.toJson(),
        "shortNameTranslation": shortNameTranslation?.toJson(),
      };
}

class ShortNameTranslationClass {
  final String? ar;

  ShortNameTranslationClass({
    this.ar,
  });

  factory ShortNameTranslationClass.fromRawJson(String str) =>
      ShortNameTranslationClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShortNameTranslationClass.fromJson(Map<String, dynamic> json) =>
      ShortNameTranslationClass(
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
      };
}

class Sport {
  final String? name;
  final String? slug;
  final int? id;

  Sport({
    this.name,
    this.slug,
    this.id,
  });

  factory Sport.fromRawJson(String str) => Sport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        name: json["name"],
        slug: json["slug"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "id": id,
      };
}

class TeamColors {
  final String? primary;
  final String? secondary;
  final String? text;

  TeamColors({
    this.primary,
    this.secondary,
    this.text,
  });

  factory TeamColors.fromRawJson(String str) =>
      TeamColors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamColors.fromJson(Map<String, dynamic> json) => TeamColors(
        primary: json["primary"],
        secondary: json["secondary"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
        "text": text,
      };
}

class Venue {
  final City? city;
  final VenueCoordinates? venueCoordinates;
  final bool? hidden;
  final String? slug;
  final String? name;
  final int? capacity;
  final int? id;
  final Country? country;
  final VenueFieldTranslations? fieldTranslations;
  final Stadium? stadium;

  Venue({
    this.city,
    this.venueCoordinates,
    this.hidden,
    this.slug,
    this.name,
    this.capacity,
    this.id,
    this.country,
    this.fieldTranslations,
    this.stadium,
  });

  factory Venue.fromRawJson(String str) => Venue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        venueCoordinates: json["venueCoordinates"] == null
            ? null
            : VenueCoordinates.fromJson(json["venueCoordinates"]),
        hidden: json["hidden"],
        slug: json["slug"],
        name: json["name"],
        capacity: json["capacity"],
        id: json["id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        fieldTranslations: json["fieldTranslations"] == null
            ? null
            : VenueFieldTranslations.fromJson(json["fieldTranslations"]),
        stadium:
            json["stadium"] == null ? null : Stadium.fromJson(json["stadium"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city?.toJson(),
        "venueCoordinates": venueCoordinates?.toJson(),
        "hidden": hidden,
        "slug": slug,
        "name": name,
        "capacity": capacity,
        "id": id,
        "country": country?.toJson(),
        "fieldTranslations": fieldTranslations?.toJson(),
        "stadium": stadium?.toJson(),
      };
}

class City {
  final String? name;

  City({
    this.name,
  });

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class VenueFieldTranslations {
  final ShortNameTranslationClass? nameTranslation;
  final SeasonCoverageInfo? shortNameTranslation;

  VenueFieldTranslations({
    this.nameTranslation,
    this.shortNameTranslation,
  });

  factory VenueFieldTranslations.fromRawJson(String str) =>
      VenueFieldTranslations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VenueFieldTranslations.fromJson(Map<String, dynamic> json) =>
      VenueFieldTranslations(
        nameTranslation: json["nameTranslation"] == null
            ? null
            : ShortNameTranslationClass.fromJson(json["nameTranslation"]),
        shortNameTranslation: json["shortNameTranslation"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["shortNameTranslation"]),
      );

  Map<String, dynamic> toJson() => {
        "nameTranslation": nameTranslation?.toJson(),
        "shortNameTranslation": shortNameTranslation?.toJson(),
      };
}

class Stadium {
  final String? name;
  final int? capacity;

  Stadium({
    this.name,
    this.capacity,
  });

  factory Stadium.fromRawJson(String str) => Stadium.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stadium.fromJson(Map<String, dynamic> json) => Stadium(
        name: json["name"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "capacity": capacity,
      };
}

class VenueCoordinates {
  final double? latitude;
  final double? longitude;

  VenueCoordinates({
    this.latitude,
    this.longitude,
  });

  factory VenueCoordinates.fromRawJson(String str) =>
      VenueCoordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VenueCoordinates.fromJson(Map<String, dynamic> json) =>
      VenueCoordinates(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Changes {
  final List<String>? changes;
  final int? changeTimestamp;

  Changes({
    this.changes,
    this.changeTimestamp,
  });

  factory Changes.fromRawJson(String str) => Changes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Changes.fromJson(Map<String, dynamic> json) => Changes(
        changes: json["changes"] == null
            ? []
            : List<String>.from(json["changes"]!.map((x) => x)),
        changeTimestamp: json["changeTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "changes":
            changes == null ? [] : List<dynamic>.from(changes!.map((x) => x)),
        "changeTimestamp": changeTimestamp,
      };
}

class Referee {
  final String? name;
  final String? slug;
  final int? yellowCards;
  final int? redCards;
  final int? yellowRedCards;
  final int? games;
  final Sport? sport;
  final int? id;
  final Country? country;

  Referee({
    this.name,
    this.slug,
    this.yellowCards,
    this.redCards,
    this.yellowRedCards,
    this.games,
    this.sport,
    this.id,
    this.country,
  });

  factory Referee.fromRawJson(String str) => Referee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        name: json["name"],
        slug: json["slug"],
        yellowCards: json["yellowCards"],
        redCards: json["redCards"],
        yellowRedCards: json["yellowRedCards"],
        games: json["games"],
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        id: json["id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "yellowCards": yellowCards,
        "redCards": redCards,
        "yellowRedCards": yellowRedCards,
        "games": games,
        "sport": sport?.toJson(),
        "id": id,
        "country": country?.toJson(),
      };
}

class RoundInfo {
  final int? round;
  final String? name;
  final String? slug;
  final int? cupRoundType;

  RoundInfo({
    this.round,
    this.name,
    this.slug,
    this.cupRoundType,
  });

  factory RoundInfo.fromRawJson(String str) =>
      RoundInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoundInfo.fromJson(Map<String, dynamic> json) => RoundInfo(
        round: json["round"],
        name: json["name"],
        slug: json["slug"],
        cupRoundType: json["cupRoundType"],
      );

  Map<String, dynamic> toJson() => {
        "round": round,
        "name": name,
        "slug": slug,
        "cupRoundType": cupRoundType,
      };
}

class Season {
  final String? name;
  final String? year;
  final bool? editor;
  final SeasonCoverageInfo? seasonCoverageInfo;
  final int? id;

  Season({
    this.name,
    this.year,
    this.editor,
    this.seasonCoverageInfo,
    this.id,
  });

  factory Season.fromRawJson(String str) => Season.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        name: json["name"],
        year: json["year"],
        editor: json["editor"],
        seasonCoverageInfo: json["seasonCoverageInfo"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["seasonCoverageInfo"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "year": year,
        "editor": editor,
        "seasonCoverageInfo": seasonCoverageInfo?.toJson(),
        "id": id,
      };
}

class Status {
  final int? code;
  final String? description;
  final String? type;

  Status({
    this.code,
    this.description,
    this.type,
  });

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
        "type": type,
      };
}

class Time {
  final int? injuryTime1;
  final int? injuryTime2;
  final int? injuryTime3;
  final int? injuryTime4;
  final int? currentPeriodStartTimestamp;

  Time({
    this.injuryTime1,
    this.injuryTime2,
    this.injuryTime3,
    this.injuryTime4,
    this.currentPeriodStartTimestamp,
  });

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        injuryTime1: json["injuryTime1"],
        injuryTime2: json["injuryTime2"],
        injuryTime3: json["injuryTime3"],
        injuryTime4: json["injuryTime4"],
        currentPeriodStartTimestamp: json["currentPeriodStartTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "injuryTime1": injuryTime1,
        "injuryTime2": injuryTime2,
        "injuryTime3": injuryTime3,
        "injuryTime4": injuryTime4,
        "currentPeriodStartTimestamp": currentPeriodStartTimestamp,
      };
}

class Tournament {
  final String? name;
  final String? slug;
  final Category? category;
  final UniqueTournament? uniqueTournament;
  final int? priority;
  final bool? isGroup;
  final int? competitionType;
  final bool? isLive;
  final int? id;

  Tournament({
    this.name,
    this.slug,
    this.category,
    this.uniqueTournament,
    this.priority,
    this.isGroup,
    this.competitionType,
    this.isLive,
    this.id,
  });

  factory Tournament.fromRawJson(String str) =>
      Tournament.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        name: json["name"],
        slug: json["slug"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        uniqueTournament: json["uniqueTournament"] == null
            ? null
            : UniqueTournament.fromJson(json["uniqueTournament"]),
        priority: json["priority"],
        isGroup: json["isGroup"],
        competitionType: json["competitionType"],
        isLive: json["isLive"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "category": category?.toJson(),
        "uniqueTournament": uniqueTournament?.toJson(),
        "priority": priority,
        "isGroup": isGroup,
        "competitionType": competitionType,
        "isLive": isLive,
        "id": id,
      };
}

class Category {
  final String? name;
  final String? slug;
  final Sport? sport;
  final int? id;
  final SeasonCoverageInfo? country;
  final String? flag;

  Category({
    this.name,
    this.slug,
    this.sport,
    this.id,
    this.country,
    this.flag,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        slug: json["slug"],
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        id: json["id"],
        country: json["country"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["country"]),
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "sport": sport?.toJson(),
        "id": id,
        "country": country?.toJson(),
        "flag": flag,
      };
}

class UniqueTournament {
  final String? name;
  final String? slug;
  final String? primaryColorHex;
  final String? secondaryColorHex;
  final Category? category;
  final int? userCount;
  final int? id;
  final SeasonCoverageInfo? country;
  final bool? hasPerformanceGraphFeature;
  final bool? hasEventPlayerStatistics;
  final bool? displayInverseHomeAwayTeams;

  UniqueTournament({
    this.name,
    this.slug,
    this.primaryColorHex,
    this.secondaryColorHex,
    this.category,
    this.userCount,
    this.id,
    this.country,
    this.hasPerformanceGraphFeature,
    this.hasEventPlayerStatistics,
    this.displayInverseHomeAwayTeams,
  });

  factory UniqueTournament.fromRawJson(String str) =>
      UniqueTournament.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UniqueTournament.fromJson(Map<String, dynamic> json) =>
      UniqueTournament(
        name: json["name"],
        slug: json["slug"],
        primaryColorHex: json["primaryColorHex"],
        secondaryColorHex: json["secondaryColorHex"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        userCount: json["userCount"],
        id: json["id"],
        country: json["country"] == null
            ? null
            : SeasonCoverageInfo.fromJson(json["country"]),
        hasPerformanceGraphFeature: json["hasPerformanceGraphFeature"],
        hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
        displayInverseHomeAwayTeams: json["displayInverseHomeAwayTeams"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "primaryColorHex": primaryColorHex,
        "secondaryColorHex": secondaryColorHex,
        "category": category?.toJson(),
        "userCount": userCount,
        "id": id,
        "country": country?.toJson(),
        "hasPerformanceGraphFeature": hasPerformanceGraphFeature,
        "hasEventPlayerStatistics": hasEventPlayerStatistics,
        "displayInverseHomeAwayTeams": displayInverseHomeAwayTeams,
      };
}
