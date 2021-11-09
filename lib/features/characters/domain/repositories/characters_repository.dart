import 'package:rick_and_morty_app/features/characters/infrastructure/dto/data.dart';

abstract class CharactersRepository {
  Future<Data> fetchCharacters();
}
