import 'package:rick_and_morty_app/features/characters/infraestructure/models/data/data_model.dart';

abstract class CharactersRepository {
  Future<Data> fetchCharacters();
}
