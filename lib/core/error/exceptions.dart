class DataException implements Exception {
  final String message;
  DataException(this.message);

  @override
  String toString() => "DataException: $message";
}

class JsonParseException extends DataException {
  JsonParseException([super.message = "Failed to parse JSON"]);
}

class FileNotFoundException extends DataException {
  FileNotFoundException([super.message = "File not found"]);
}

class PermissionDeniedException extends DataException {
  PermissionDeniedException([super.message = "Permission denied"]);
}

class CorruptedDataException extends DataException {
  CorruptedDataException([super.message = "Data is corrupted"]);
}

class ReadException extends DataException {
  ReadException([super.message = "Failed to read data"]);
}

class WriteException extends DataException {
  WriteException([super.message = "Failed to write data"]);
}

class SchemaMismatchException extends DataException {
  SchemaMismatchException([super.message = "Schema does not match"]);
}

class ValidationException extends DataException {
  ValidationException([super.message = "Data validation failed"]);
}
