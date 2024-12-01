import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/sample_logo.dart';

import '../../../../core/error/failure.dart';
import '../repository/three_score_app_repository.dart';

class GetSampleLogo {
  late final ThreeScoreAppRepository threeScoreAppRepository;
  GetSampleLogo(this.threeScoreAppRepository);

  Future<Either<Failure, Logo>?>? execute() async {
    return await threeScoreAppRepository.getSampleLogo();
  }
}
