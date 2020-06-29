import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/config/app_config.dart';

class MyGraphQlClient {
  final OptimisticCache cache = OptimisticCache(
    dataIdFromObject: uuidFromObject,
  );

  MyGraphQlClient();

  GraphQLClient get client {
    Link link = HttpLink(uri: AppConfig.instance.apiHost);

    return GraphQLClient(
      cache: cache,
      link: link,
    );
  }
}

String uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final String typeName = object['__typename'] as String;
    final String id = object['id'].toString();
    if (typeName != null && id != null) {
      return <String>[typeName, id].join('/');
    }
  }
  return null;
}
