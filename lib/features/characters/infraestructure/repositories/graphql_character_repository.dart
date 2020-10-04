import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/data_sources/characters_data_source.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/data/data_model.dart';

import '../../../../exception/custom_exception.dart';

class GraphQLCharacterRepository extends CharactersRepository {
  final CharactersDataSource _dataSource;

  GraphQLCharacterRepository({CharactersDataSource dataSource}) : _dataSource = dataSource ?? Get.find();

  Future<Data> fetchCharacters() async {
    var _response = await _dataSource.fetchCharacters();

    if (_response.exception != null) {
      throw ResponseException(_response.exception);
    }

    if (_response.data != null) {
      return Data.fromJson(_response.data['characters']);
    }
    throw ServerException('Se ha producido un error al contactar con el servidor');
  }
}
