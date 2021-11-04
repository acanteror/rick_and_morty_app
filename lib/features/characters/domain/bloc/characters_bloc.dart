import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infrastructure/dto/data.dart';
import 'package:rick_and_morty_app/features/favourites/domain/repositories/favourites_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository _charactersRepository;
  final FavouritesRepository _favouritesRepository;

  CharactersBloc({charactersRepository, favouritesRepository})
      : _charactersRepository =
            charactersRepository ?? Get.find<CharactersRepository>(),
        _favouritesRepository =
            favouritesRepository ?? Get.find<FavouritesRepository>(),
        super(CharactersInitial());

  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    if (event is CharactersFetch) {
      yield CharactersLoading();
      try {
        final Data _response = await _charactersRepository.fetchCharacters();
        final List<Character> _characters = _response.results;
        yield CharactersLoaded(characters: _characters);
      } catch (e) {
        yield CharactersError();
      }
    }

    if (event is CharactersFilter) {
      yield CharactersLoading();
      try {
        final Data _response = await _charactersRepository.fetchCharacters();
        final List<Character> _characters = _response.results;

        final List<String> _favourites =
            _favouritesRepository.fetchFavourites();

        yield CharactersLoaded(
          characters: _characters
              .where(
                (element) => _favourites.contains(element.id),
              )
              .map(
                (e) => e.copyWith(
                  isFavourite: true,
                ),
              ),
        );
      } catch (e) {
        yield CharactersError();
      }
    }
  }
}
