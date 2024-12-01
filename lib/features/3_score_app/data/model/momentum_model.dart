import 'dart:convert';

class MomentumModel {
  final bool? success;
  final Data? data;

  MomentumModel({
    this.success,
    this.data,
  });

  factory MomentumModel.fromRawJson(String str) =>
      MomentumModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MomentumModel.fromJson(Map<String, dynamic> json) => MomentumModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final List<GraphPoint>? graphPoints;
  final int? periodTime;
  final int? periodCount;

  Data({
    this.graphPoints,
    this.periodTime,
    this.periodCount,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        graphPoints: json["graphPoints"] == null
            ? []
            : List<GraphPoint>.from(
                json["graphPoints"]!.map((x) => GraphPoint.fromJson(x))),
        periodTime: json["periodTime"],
        periodCount: json["periodCount"],
      );

  Map<String, dynamic> toJson() => {
        "graphPoints": graphPoints == null
            ? []
            : List<dynamic>.from(graphPoints!.map((x) => x.toJson())),
        "periodTime": periodTime,
        "periodCount": periodCount,
      };
}

class GraphPoint {
  final double? minute;
  final int? value;

  GraphPoint({
    this.minute,
    this.value,
  });

  factory GraphPoint.fromRawJson(String str) =>
      GraphPoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GraphPoint.fromJson(Map<String, dynamic> json) => GraphPoint(
        minute: json["minute"]?.toDouble(),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "minute": minute,
        "value": value,
      };
}
