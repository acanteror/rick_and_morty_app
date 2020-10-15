import 'package:lumberdash/lumberdash.dart';
import 'package:rick_and_morty_app/exception/custom_exception.dart';

enum ExceptionType {
  graphql,
  response,
  server,
}

class ExceptionLogger {
  Exception exception(
    ExceptionType type,
    String errorMessage,
  ) {
    Exception _exception;
    switch (type) {
      case ExceptionType.graphql:
        _exception = GraphQLException(errorMessage);
        break;
      case ExceptionType.response:
        _exception = ResponseException(errorMessage);
        break;
      case ExceptionType.server:
        _exception = ServerException(errorMessage);
        break;
      default:
        _exception = Exception(errorMessage);
    }
    logError(_exception);
    return _exception;
  }
}
