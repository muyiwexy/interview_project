import 'package:get_it/get_it.dart';
import 'package:interview_project/features/3_score_app/data/datasources/three_score_local_data.dart';
import 'package:interview_project/features/3_score_app/data/repository/three_score_repository_impl.dart';
import 'package:interview_project/features/3_score_app/domain/repository/three_score_app_repository.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_best_player.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_incident_data.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_match_info.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_match_stats.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_momentum_data.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_sample_logo.dart';
import 'package:interview_project/features/3_score_app/domain/usecases/get_video_highlight.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/incident_bloc/incident_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';

final serviceLocator = GetIt.asNewInstance();

class InjectionContainer {
  InjectionContainer._internal();

  static final InjectionContainer _instance = InjectionContainer._internal();

  factory InjectionContainer() {
    return _instance;
  }

  void init() {
    //! Feature - Three Score app
    // Bloc
    serviceLocator.registerFactory(
      () => IncidentBloc(
        getIncidentData: serviceLocator(),
      ),
    );
    serviceLocator.registerFactory(
      () => MatchDataBloc(
          getSampleLogo: serviceLocator(),
          getMatchInfo: serviceLocator(),
          getVideoHighlight: serviceLocator(),
          getBestPlayer: serviceLocator(),
          getMatchStats: serviceLocator(),
          getMomentumData: serviceLocator()),
    );
    // use cases
    serviceLocator.registerLazySingleton(
      () => GetIncidentData(serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => GetSampleLogo(serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => GetMatchInfo(serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => GetVideoHighlight(serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => GetBestPlayer(serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => GetMomentumData(serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => GetMatchStats(serviceLocator()),
    );

    // Repository
    serviceLocator.registerLazySingleton<ThreeScoreAppRepository>(
      () => ThreeScoreAppRepositoryImpl(
          threeScoreLocalDataSource: serviceLocator()),
    );

    // Data sources
    serviceLocator.registerLazySingleton<ThreeScoreLocalDataSource>(
      () => ThreeScoreLocalDataSourceImpl(),
    );
  }
}
