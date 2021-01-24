import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/client/graphql_client.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repositories/character_detail_repository.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/data_sources/character_detail_datasource.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/repositories/graphql_character_detail_respository.dart';
import 'package:rick_and_morty_app/features/characters/domain/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/data_sources/characters_data_source.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/repositories/graphql_character_repository.dart';

void configureInyector() {
  Get.lazyPut<GraphQLClient>(() => MyGraphQlClient().client);
  Get.lazyPut<CharactersDataSource>(() => GraphQLCharactersDataSource(), fenix: true);
  Get.lazyPut<CharactersRepository>(() => GraphQLCharactersRepository(), fenix: true);
  Get.lazyPut<CharactersBloc>(() => CharactersBloc(), fenix: true);

  Get.lazyPut<CharacterDetailDataSource>(() => GraphQLCharacterDetailDataSource(), fenix: true);
  Get.lazyPut<CharacterDetailRepository>(() => GraphQLCharacterDetailRepository(), fenix: true);
  Get.lazyPut<CharacterBloc>(() => CharacterBloc(), fenix: true);
}
