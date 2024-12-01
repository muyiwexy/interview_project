// ignore_for_file: constant_identifier_names

import 'dart:convert';

class MatchStatsModel {
  final bool? success;
  final Data? data;

  MatchStatsModel({
    this.success,
    this.data,
  });

  factory MatchStatsModel.fromRawJson(String str) =>
      MatchStatsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchStatsModel.fromJson(Map<String, dynamic> json) =>
      MatchStatsModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Statistic>? statistics;

  Data({
    this.statistics,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statistics: json["statistics"] == null
            ? []
            : List<Statistic>.from(
                json["statistics"]!.map((x) => Statistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statistics": statistics == null
            ? []
            : List<dynamic>.from(statistics!.map((x) => x.toJson())),
      };
}

class Statistic {
  final String? period;
  final List<Group>? groups;

  Statistic({
    this.period,
    this.groups,
  });

  factory Statistic.fromRawJson(String str) =>
      Statistic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        period: json["period"],
        groups: json["groups"] == null
            ? []
            : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "period": period,
        "groups": groups == null
            ? []
            : List<dynamic>.from(groups!.map((x) => x.toJson())),
      };
}

class Group {
  final String? groupName;
  final List<StatisticsItem>? statisticsItems;

  Group({
    this.groupName,
    this.statisticsItems,
  });

  factory Group.fromRawJson(String str) => Group.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        groupName: json["groupName"],
        statisticsItems: json["statisticsItems"] == null
            ? []
            : List<StatisticsItem>.from(json["statisticsItems"]!
                .map((x) => StatisticsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groupName": groupName,
        "statisticsItems": statisticsItems == null
            ? []
            : List<dynamic>.from(statisticsItems!.map((x) => x.toJson())),
      };
}

class StatisticsItem {
  final String? name;
  final String? home;
  final String? away;
  final int? compareCode;
  final StatisticsType? statisticsType;
  final ValueType? valueType;
  final double? homeValue;
  final double? awayValue;
  final int? renderType;
  final String? key;
  final int? homeTotal;
  final int? awayTotal;

  StatisticsItem({
    this.name,
    this.home,
    this.away,
    this.compareCode,
    this.statisticsType,
    this.valueType,
    this.homeValue,
    this.awayValue,
    this.renderType,
    this.key,
    this.homeTotal,
    this.awayTotal,
  });

  factory StatisticsItem.fromRawJson(String str) =>
      StatisticsItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatisticsItem.fromJson(Map<String, dynamic> json) => StatisticsItem(
        name: json["name"],
        home: json["home"],
        away: json["away"],
        compareCode: json["compareCode"],
        statisticsType: statisticsTypeValues.map[json["statisticsType"]]!,
        valueType: valueTypeValues.map[json["valueType"]]!,
        homeValue: json["homeValue"]?.toDouble(),
        awayValue: json["awayValue"]?.toDouble(),
        renderType: json["renderType"],
        key: json["key"],
        homeTotal: json["homeTotal"],
        awayTotal: json["awayTotal"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "home": home,
        "away": away,
        "compareCode": compareCode,
        "statisticsType": statisticsTypeValues.reverse[statisticsType],
        "valueType": valueTypeValues.reverse[valueType],
        "homeValue": homeValue,
        "awayValue": awayValue,
        "renderType": renderType,
        "key": key,
        "homeTotal": homeTotal,
        "awayTotal": awayTotal,
      };
}

enum StatisticsType { NEGATIVE, POSITIVE }

final statisticsTypeValues = EnumValues(
    {"negative": StatisticsType.NEGATIVE, "positive": StatisticsType.POSITIVE});

enum ValueType { EVENT, TEAM }

final valueTypeValues =
    EnumValues({"event": ValueType.EVENT, "team": ValueType.TEAM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
