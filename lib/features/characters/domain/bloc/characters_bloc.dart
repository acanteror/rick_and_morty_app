import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/dto/data.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository _charactersRepository;

  CharactersBloc({charactersRepository})
      : _charactersRepository = charactersRepository ?? Get.find<CharactersRepository>(),
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
  }
}
