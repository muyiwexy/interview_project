import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/model/incident.dart';
import '../../../domain/usecases/get_incident_data.dart';
part 'incident_event.dart';
part 'incident_state.dart';

class IncidentBloc extends Bloc<IncidentEvent, IncidentState> {
  final GetIncidentData getIncidentData;

  IncidentBloc({required this.getIncidentData}) : super(IncidentInitial()) {
    on<FetchIncidentData>((event, emit) async {
      emit(IncidentLoading());

      final Either<Failure, RootIncident>? result =
          await getIncidentData.execute();

      result?.fold(
        (failure) => emit(IncidentError(_mapFailureToMessage(failure))),
        (incident) => emit(IncidentDataLoaded(incident)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (JsonParseFailure):
        return "Error parsing data.";
      case const (FileNotFoundFailure):
        return "Data file not found.";
      case const (PermissionDeniedFailure):
        return "Permission denied.";
      case const (ReadFailure):
        return "Error reading data.";
      default:
        return "Unexpected error.";
    }
  }
}
