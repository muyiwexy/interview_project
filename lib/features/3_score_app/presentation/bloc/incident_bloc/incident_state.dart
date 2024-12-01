part of 'incident_bloc.dart';

sealed class IncidentState extends Equatable {
  const IncidentState();

  @override
  List<Object> get props => [];
}

class IncidentInitial extends IncidentState {}

class IncidentLoading extends IncidentState {}

class IncidentDataLoaded extends IncidentState {
  final RootIncident incident;

  const IncidentDataLoaded(this.incident);

  @override
  List<Object> get props => [incident];
}

class IncidentError extends IncidentState {
  final String message;

  const IncidentError(this.message);

  @override
  List<Object> get props => [message];
}
