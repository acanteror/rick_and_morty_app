import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class CharactersDataSource {
  Future<QueryResult> fetchCharacters();
}

class GraphQLCharactersDataSource extends CharactersDataSource {
  final GraphQLClient graphQLClient;

  GraphQLCharactersDataSource({graphQLClient}) : this.graphQLClient = graphQLClient ?? Get.find();

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
    var result = await graphQLClient.query(
      QueryOptions(
        documentNode: gql(charactersQuery()),
      ),
    );
    return result;
  }
}
