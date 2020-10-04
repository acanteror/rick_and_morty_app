import 'package:graphql_flutter/graphql_flutter.dart';

final errors = [GraphQLError(message: 'error')];

final tResponseWithErrors = QueryResult(
  exception: OperationException(graphqlErrors: errors),
);

final charactersDataResponse = <String, dynamic>{
  'characters': {
    "info": {"count": 100, "pages": 10, "next": 2, "prev": null},
    "results": [
      {
        "id": "id",
        "name": "name",
        "status": "status",
        "species": "species",
        "type": "type",
        "gender": "gender",
        "image": "image"
      }
    ]
  }
};

final tCharactersResponse = QueryResult(data: charactersDataResponse);
