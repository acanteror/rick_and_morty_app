import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/api/character/character_api.dart';
import 'package:rick_and_morty_app/api/client/graphql_client.dart';
import 'package:rick_and_morty_app/service/character_service.dart';

void configureInyector() {
  Get.lazyPut<GraphQLClient>(() => MyGraphQlClient().client);
  Get.lazyPut<CharacterApi>(() => CharacterApiImpl());
  Get.lazyPut<CharacterService>(() => CharacterServiceImpl());
}
