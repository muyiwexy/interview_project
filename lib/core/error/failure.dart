import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<Object?> properties;

  const Failure([this.properties = const <Object?>[]]);

  @override
  List<Object?> get props => [properties];
}

class JsonParseFailure extends Failure {}

class FileNotFoundFailure extends Failure {}

class PermissionDeniedFailure extends Failure {}

class CorruptedDataFailure extends Failure {}

class ReadFailure extends Failure {}

class WriteFailure extends Failure {}

class SchemaMismatchFailure extends Failure {}

class ValidationFailure extends Failure {}

class CacheFailure extends Failure {}
