import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/data/data_model.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/result/result_model.dart';

part 'character_event.dart';

part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository _characterService;

  CharacterBloc({characterService})
      : _characterService = characterService ?? Get.find<CharactersRepository>(),
        super(CharacterInitial());

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is CharacterFetch) {
      yield CharacterLoading();

      try {
        final Data _response = await _characterService.fetchCharacters();
        final List<Result> _characters = _response.results;
        yield CharacterLoaded(characters: _characters);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
