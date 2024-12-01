import 'dart:convert';

class HighlightModel {
  final bool? success;
  final Data? data;

  HighlightModel({
    this.success,
    this.data,
  });

  factory HighlightModel.fromRawJson(String str) =>
      HighlightModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HighlightModel.fromJson(Map<String, dynamic> json) => HighlightModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Highlight>? highlights;

  Data({
    this.highlights,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        highlights: json["highlights"] == null
            ? []
            : List<Highlight>.from(
                json["highlights"]!.map((x) => Highlight.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "highlights": highlights == null
            ? []
            : List<dynamic>.from(highlights!.map((x) => x.toJson())),
      };
}

class Highlight {
  final String? title;
  final String? subtitle;
  final String? url;
  final String? thumbnailUrl;
  final int? mediaType;
  final bool? doFollow;
  final bool? keyHighlight;
  final int? id;
  final int? createdAtTimestamp;
  final String? sourceUrl;

  Highlight({
    this.title,
    this.subtitle,
    this.url,
    this.thumbnailUrl,
    this.mediaType,
    this.doFollow,
    this.keyHighlight,
    this.id,
    this.createdAtTimestamp,
    this.sourceUrl,
  });

  factory Highlight.fromRawJson(String str) =>
      Highlight.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Highlight.fromJson(Map<String, dynamic> json) => Highlight(
        title: json["title"],
        subtitle: json["subtitle"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
        mediaType: json["mediaType"],
        doFollow: json["doFollow"],
        keyHighlight: json["keyHighlight"],
        id: json["id"],
        createdAtTimestamp: json["createdAtTimestamp"],
        sourceUrl: json["sourceUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
        "mediaType": mediaType,
        "doFollow": doFollow,
        "keyHighlight": keyHighlight,
        "id": id,
        "createdAtTimestamp": createdAtTimestamp,
        "sourceUrl": sourceUrl,
      };
}
