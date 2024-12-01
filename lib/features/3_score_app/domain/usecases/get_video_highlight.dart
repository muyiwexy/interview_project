import 'package:dartz/dartz.dart';
import 'package:interview_project/features/3_score_app/data/model/highlight_model.dart';

import '../../../../core/error/failure.dart';
import '../repository/three_score_app_repository.dart';

class GetVideoHighlight {
  late final ThreeScoreAppRepository threeScoreAppRepository;
  GetVideoHighlight(this.threeScoreAppRepository);

  Future<Either<Failure, HighlightModel>?>? execute() async {
    return await threeScoreAppRepository.getVideoHighLights();
  }
}
