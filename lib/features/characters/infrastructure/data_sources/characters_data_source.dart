import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/exception/exception_logger.dart';

abstract class CharactersDataSource {
  Future<QueryResult> fetchCharacters();
}

class GraphQLCharactersDataSource extends CharactersDataSource with ExceptionLogger {
  final GraphQLClient graphQLClient;

  GraphQLCharactersDataSource({
    graphQLClient,
  }) : this.graphQLClient = graphQLClient ?? Get.find();

  String charactersQuery() {
    return '''
        query {
      characters(page: 1) {
        info{
          count
          pages
          next
          prev
        }
        results {
          id
          name
          status
          species
          type
          gender
          image
        }
      }
    }
    ''';
  }

  @override
  Future<QueryResult> fetchCharacters() async {
    try {
      QueryResult _result = await graphQLClient.query(
        QueryOptions(
          documentNode: gql(charactersQuery()),
        ),
      );
      return _result;
    } catch (_exception) {
      throw exception(
        ExceptionType.graphql,
        _exception.toString(),
      );
    }
  }
}
