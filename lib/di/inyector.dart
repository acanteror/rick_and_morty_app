import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/client/graphql_client.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/use_cases/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/data_sources/characters_data_source.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/repositories/graphql_character_repository.dart';

void configureInyector() {
  Get.lazyPut<GraphQLClient>(() => MyGraphQlClient().client);
  Get.lazyPut<CharactersDataSource>(() => GraphQLCharactersDataSource());
  Get.lazyPut<CharactersRepository>(() => GraphQLCharacterRepository());
  Get.lazyPut<CharactersBloc>(() => CharactersBloc());
}
