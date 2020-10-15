import 'package:lumberdash/lumberdash.dart';

class ResponseException implements Exception {
  final message;
  ResponseException([this.message]);

  call() => toString();

  String toString() {
    if (message == null) return "Exception";
    return "ResponseException: $message";
  }
}

class GraphQLException implements Exception {
  final message;
  GraphQLException([this.message]);

  call() => toString();

  String toString() {
    if (message == null) return "Exception";
    return "ResponseException: $message";
  }
}

class ServerException implements Exception {
  final message;
  ServerException([this.message]);

  call() => logError(this.toString());

  String toString() {
    if (message == null) return "Exception";
    return "ServerException: $message";
  }
}
