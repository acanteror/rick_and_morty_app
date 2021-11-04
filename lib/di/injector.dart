import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/client/graphql_client.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repositories/character_detail_repository.dart';
import 'package:rick_and_morty_app/features/character_detail/infrastructure/data_sources/character_detail_datasource.dart';
import 'package:rick_and_morty_app/features/character_detail/infrastructure/repositories/graphql_character_detail_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infrastructure/data_sources/characters_data_source.dart';
import 'package:rick_and_morty_app/features/characters/infrastructure/repositories/graphql_character_repository.dart';
import 'package:rick_and_morty_app/features/favourites/domain/bloc/favourites_bloc.dart';
import 'package:rick_and_morty_app/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:rick_and_morty_app/features/favourites/infrastructure/data_sources/favourites_preferences.dart';
import 'package:rick_and_morty_app/features/favourites/infrastructure/repositories/shared_preferences_favourites_respository.dart';

void configureInjector() async {
  Get.lazyPut<FavouritesPreferences>(
    () => FavouritesPreferences()..initPrefs(),
    fenix: true,
  );
  Get.lazyPut<GraphQLClient>(() => MyGraphQlClient().client);
  Get.lazyPut<CharactersDataSource>(() => GraphQLCharactersDataSource(),
      fenix: true);
  Get.lazyPut<CharactersRepository>(() => GraphQLCharactersRepository(),
      fenix: true);
  Get.lazyPut<CharactersBloc>(() => CharactersBloc(), fenix: true);

  Get.lazyPut<CharacterDetailDataSource>(
      () => GraphQLCharacterDetailDataSource(),
      fenix: true);
  Get.lazyPut<CharacterDetailRepository>(
      () => GraphQLCharacterDetailRepository(),
      fenix: true);
  Get.lazyPut<CharacterBloc>(() => CharacterBloc(), fenix: true);

  Get.lazyPut<FavouritesRepository>(
      () => SharedPreferencesFavouritesRepository(),
      fenix: true);
  Get.lazyPut<FavouritesBloc>(() => FavouritesBloc(), fenix: true);
}
