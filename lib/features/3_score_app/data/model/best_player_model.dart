import 'dart:convert';

class BestPlayerModel {
  final bool? success;
  final Data? data;

  BestPlayerModel({
    this.success,
    this.data,
  });

  factory BestPlayerModel.fromRawJson(String str) =>
      BestPlayerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BestPlayerModel.fromJson(Map<String, dynamic> json) =>
      BestPlayerModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final BestTeamPlayer? bestHomeTeamPlayer;
  final BestTeamPlayer? bestAwayTeamPlayer;

  Data({
    this.bestHomeTeamPlayer,
    this.bestAwayTeamPlayer,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bestHomeTeamPlayer: json["bestHomeTeamPlayer"] == null
            ? null
            : BestTeamPlayer.fromJson(json["bestHomeTeamPlayer"]),
        bestAwayTeamPlayer: json["bestAwayTeamPlayer"] == null
            ? null
            : BestTeamPlayer.fromJson(json["bestAwayTeamPlayer"]),
      );

  Map<String, dynamic> toJson() => {
        "bestHomeTeamPlayer": bestHomeTeamPlayer?.toJson(),
        "bestAwayTeamPlayer": bestAwayTeamPlayer?.toJson(),
      };
}

class BestTeamPlayer {
  final String? value;
  final String? label;
  final Player? player;

  BestTeamPlayer({
    this.value,
    this.label,
    this.player,
  });

  factory BestTeamPlayer.fromRawJson(String str) =>
      BestTeamPlayer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BestTeamPlayer.fromJson(Map<String, dynamic> json) => BestTeamPlayer(
        value: json["value"],
        label: json["label"],
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
        "player": player?.toJson(),
      };
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

  factory Player.fromRawJson(String str) => Player.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["name"],
        slug: json["slug"],
        shortName: json["shortName"],
        position: json["position"],
        jerseyNumber: json["jerseyNumber"],
        height: json["height"],
        userCount: json["userCount"],
        id: json["id"],
        marketValueCurrency: json["marketValueCurrency"],
        dateOfBirthTimestamp: json["dateOfBirthTimestamp"],
        proposedMarketValueRaw: json["proposedMarketValueRaw"] == null
            ? null
            : ProposedMarketValueRaw.fromJson(json["proposedMarketValueRaw"]),
        fieldTranslations: json["fieldTranslations"] == null
            ? null
            : FieldTranslations.fromJson(json["fieldTranslations"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "shortName": shortName,
        "position": position,
        "jerseyNumber": jerseyNumber,
        "height": height,
        "userCount": userCount,
        "id": id,
        "marketValueCurrency": marketValueCurrency,
        "dateOfBirthTimestamp": dateOfBirthTimestamp,
        "proposedMarketValueRaw": proposedMarketValueRaw?.toJson(),
        "fieldTranslations": fieldTranslations?.toJson(),
      };
}

class FieldTranslations {
  final NameTranslation? nameTranslation;
  final NameTranslation? shortNameTranslation;

  FieldTranslations({
    this.nameTranslation,
    this.shortNameTranslation,
  });

  factory FieldTranslations.fromRawJson(String str) =>
      FieldTranslations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FieldTranslations.fromJson(Map<String, dynamic> json) =>
      FieldTranslations(
        nameTranslation: json["nameTranslation"] == null
            ? null
            : NameTranslation.fromJson(json["nameTranslation"]),
        shortNameTranslation: json["shortNameTranslation"] == null
            ? null
            : NameTranslation.fromJson(json["shortNameTranslation"]),
      );

  Map<String, dynamic> toJson() => {
        "nameTranslation": nameTranslation?.toJson(),
        "shortNameTranslation": shortNameTranslation?.toJson(),
      };
}

class NameTranslation {
  final String? ar;

  NameTranslation({
    this.ar,
  });

  factory NameTranslation.fromRawJson(String str) =>
      NameTranslation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NameTranslation.fromJson(Map<String, dynamic> json) =>
      NameTranslation(
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
      };
}

class ProposedMarketValueRaw {
  final int? value;
  final String? currency;

  ProposedMarketValueRaw({
    this.value,
    this.currency,
  });

  factory ProposedMarketValueRaw.fromRawJson(String str) =>
      ProposedMarketValueRaw.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProposedMarketValueRaw.fromJson(Map<String, dynamic> json) =>
      ProposedMarketValueRaw(
        value: json["value"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currency,
      };
}
