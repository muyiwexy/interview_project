import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/incident.dart';
import 'package:interview_project/features/3_score_app/domain/repository/three_score_app_repository.dart';

import '../../../../core/error/failure.dart';

class GetIncidentData {
  late final ThreeScoreAppRepository threeScoreAppRepository;
  GetIncidentData(this.threeScoreAppRepository);

  Future<Either<Failure, RootIncident>?>? execute() async {
    return await threeScoreAppRepository.getIncidentData();
  }
}
