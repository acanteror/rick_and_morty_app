import 'package:rick_and_morty_app/features/characters/infraestructure/dto/data.dart';

abstract class CharactersRepository {
  Future<Data> fetchCharacters();
}
