class ServerException implements Exception {
  String? cause;
  ServerException(this.cause);
}

class DataException implements Exception {
  String? cause;
  DataException(this.cause);
}
