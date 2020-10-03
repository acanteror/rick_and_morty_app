import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/client/graphql_client.dart';
import 'package:rick_and_morty_app/features/characters/domain/services/character_service.dart';
import 'package:rick_and_morty_app/features/characters/domain/use_cases/character_controller.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/data_sources/character_api.dart';

void configureInyector() {
  Get.lazyPut<GraphQLClient>(() => MyGraphQlClient().client);
  Get.lazyPut<CharacterApi>(() => CharacterApiImpl());
  Get.lazyPut<CharacterService>(() => CharacterServiceImpl());
  Get.lazyPut<CharacterController>(() => CharacterController());
}
