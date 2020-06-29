import 'package:get/get.dart';
import 'package:rick_and_morty_app/api/character/character_api.dart';
import 'package:rick_and_morty_app/exception/custom_exception.dart';
import 'package:rick_and_morty_app/model/data/data_model.dart';

abstract class CharacterService {
  Future<Data> fetchCharacters();
}

class CharacterServiceImpl extends CharacterService {
  final CharacterApi api;

  CharacterServiceImpl({api}) : this.api = api ?? Get.find();

  Future<Data> fetchCharacters() async {
    var _response = await api.fetchCharacters();

    if (_response.exception != null) {
      throw ResponseException(_response.exception);
    }

    if (_response.data != null) {
      return Data.fromJson(_response.data['characters']);
    }
    throw ServerException(
        'Se ha producido un error al contactar con el servidor');
  }
}
