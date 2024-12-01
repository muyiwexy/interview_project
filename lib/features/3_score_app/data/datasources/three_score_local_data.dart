// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:interview_project/core/assets/json_assets.dart';
import 'package:interview_project/features/3_score_app/data/model/best_player_model.dart';
import 'package:interview_project/features/3_score_app/data/model/highlight_model.dart';
import 'package:interview_project/features/3_score_app/data/model/incident.dart';
import 'package:interview_project/features/3_score_app/data/model/match.dart';
import 'package:interview_project/features/3_score_app/data/model/match_stats_models.dart';
import 'package:interview_project/features/3_score_app/data/model/momentum_model.dart';
import 'package:interview_project/features/3_score_app/data/model/sample_logo.dart';

import '../../../../core/error/exceptions.dart';

abstract class ThreeScoreLocalDataSource {
  Future<RootIncident>? getIncidentData();
  Future<Logo>? getSampleLogo();
  Future<MatchModel>? getMatchInfo();
  Future<HighlightModel>? getVideoHighLights();
  Future<BestPlayerModel>? getBestPlayer();
  Future<MatchStatsModel>? getMatchStats();
  Future<MomentumModel>? getMomentumData();
}

class ThreeScoreLocalDataSourceImpl extends ThreeScoreLocalDataSource {
  @override
  Future<RootIncident>? getIncidentData() async {
    try {
      final String response =
          await rootBundle.loadString(JsonAssets.incidentdata);
      final data = json.decode(response);
      return RootIncident.fromJson(data);
    } on FormatException catch (_) {
      throw JsonParseException("Failed to parse JSON data.");
    } on PlatformException catch (_) {
      throw FileNotFoundException("JSON file not found in assets.");
    } catch (e) {
      print(e.toString());
      throw ReadException();
    }
  }

  @override
  Future<Logo>? getSampleLogo() async {
    try {
      final String response =
          await rootBundle.loadString(JsonAssets.sampleLogo);
      final data = json.decode(response);
      return Logo.fromJson(data);
    } on FormatException catch (_) {
      throw JsonParseException("Failed to parse JSON data.");
    } on PlatformException catch (_) {
      throw FileNotFoundException("JSON file not found in assets.");
    } catch (e) {
      print("getSampleLogo: $e");
      throw ReadException();
    }
  }

  @override
  Future<MatchModel>? getMatchInfo() async {
    try {
      final String response = await rootBundle.loadString(JsonAssets.match);
      final data = json.decode(response);
      return MatchModel.fromJson(data);
    } on FormatException catch (_) {
      throw JsonParseException("Failed to parse JSON data.");
    } on PlatformException catch (_) {
      throw FileNotFoundException("JSON file not found in assets.");
    } catch (e) {
      print("getMatchInfo: $e");
      throw ReadException();
    }
  }

  @override
  Future<HighlightModel>? getVideoHighLights() async {
    try {
      final String response =
          await rootBundle.loadString(JsonAssets.videoHighlight);
      final data = json.decode(response);
      return HighlightModel.fromJson(data);
    } on FormatException catch (_) {
      throw JsonParseException("Failed to parse JSON data.");
    } on PlatformException catch (_) {
      throw FileNotFoundException("JSON file not found in assets.");
    } catch (e) {
      print("getVideoHighLights: $e");
      throw ReadException();
    }
  }

  @override
  Future<BestPlayerModel>? getBestPlayer() async {
    try {
      final String response =
          await rootBundle.loadString(JsonAssets.bestPlayer);
      final data = json.decode(response);
      return BestPlayerModel.fromJson(data);
    } on FormatException catch (_) {
      throw JsonParseException("Failed to parse JSON data.");
    } on PlatformException catch (_) {
      throw FileNotFoundException("JSON file not found in assets.");
    } catch (e) {
      print("getVideoHighLights: $e");
      throw ReadException();
    }
  }

  @override
  Future<MatchStatsModel>? getMatchStats() async {
    try {
      final String response =
          await rootBundle.loadString(JsonAssets.matchStats);
      final data = json.decode(response);
      return MatchStatsModel.fromJson(data);
    } on FormatException catch (_) {
      throw JsonParseException("Failed to parse JSON data.");
    } on PlatformException catch (_) {
      throw FileNotFoundException("JSON file not found in assets.");
    } catch (e) {
      print("getVideoHighLights: $e");
      throw ReadException();
    }
  }

  @override
  Future<MomentumModel>? getMomentumData() async {
    try {
      final String response = await rootBundle.loadString(JsonAssets.momentum);
      final data = json.decode(response);
      return MomentumModel.fromJson(data);
    } on FormatException catch (_) {
      throw JsonParseException("Failed to parse JSON data.");
    } on PlatformException catch (_) {
      throw FileNotFoundException("JSON file not found in assets.");
    } catch (e) {
      print("getVideoHighLights: $e");
      throw ReadException();
    }
  }
}
