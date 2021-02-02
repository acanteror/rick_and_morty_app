import 'package:rick_and_morty_app/exception/exception_logger.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/models/character_detail_viewmodel.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repositories/character_detail_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/repositories/fake_character_repository.dart';

class FakeCharacterDetailRepository extends CharacterDetailRepository with ExceptionLogger {
  FakeCharacterDetailRepository();

  Future<CharacterDetailViewModel> fetchCharacterDetail(String id) async {
    final CharacterDetailViewModel fCharacterDetailViewModel = CharacterDetailViewModel(
      character: _getCharacter(id),
      episodes: [],
    );
    await Future.delayed(const Duration(seconds: 4));

    return fCharacterDetailViewModel;
  }

  Character _getCharacter(String id) {
    return fCharacters[int.parse(id) - 1];
  }
}
