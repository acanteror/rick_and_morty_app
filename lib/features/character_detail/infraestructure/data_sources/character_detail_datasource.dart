import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/exception/exception_logger.dart';

abstract class CharacterDetailDataSource {
  Future<QueryResult> fetchCharacterDetail(String id);
}

class GraphQLCharacterDetailDataSource extends CharacterDetailDataSource with ExceptionLogger {
  final GraphQLClient graphQLClient;

  GraphQLCharacterDetailDataSource({
    graphQLClient,
  }) : this.graphQLClient = graphQLClient ?? Get.find();

  String characterQuery(String id) {
    return r'''
        query characterDetail($id: id!) {
      character(id: $id) {
        id
    		name
    		status
    		species
    		type
    		gender
    		image
    		episode {
          id
          name
          air_date
          episode
        }
      }
    }
    ''';
  }

  @override
  Future<QueryResult> fetchCharacterDetail(String id) async {
    try {
      Map<String, dynamic> _variables = <String, dynamic>{
        'id': id,
      };
      QueryResult _result = await graphQLClient.query(
        QueryOptions(
          documentNode: gql(characterQuery(id)),
          variables: _variables,
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
