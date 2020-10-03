import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class CharacterApi {
  Future<dynamic> fetchCharacters();
}

class CharacterApiImpl extends CharacterApi {
  final GraphQLClient graphQLClient;

  CharacterApiImpl({graphQLClient})
      : this.graphQLClient = graphQLClient ?? Get.find();

  String charactersQuery() {
    return '''
        query {
      characters(page: 1) {
        info {
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
  Future fetchCharacters() async {
    var result = await graphQLClient.query(
      QueryOptions(documentNode: gql(charactersQuery())),
    );
    return result;
  }
}
