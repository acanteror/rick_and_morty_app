import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/exception/exception_logger.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/data_sources/characters_data_source.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/data.dart';

class GraphQLCharacterRepository extends CharactersRepository with ExceptionLogger {
  final CharactersDataSource _dataSource;

  GraphQLCharacterRepository({
    CharactersDataSource dataSource,
  }) : _dataSource = dataSource ?? Get.find();

  Future<Data> fetchCharacters() async {
    try {
      QueryResult _response = await _dataSource.fetchCharacters();

      if (_response.exception != null) {
        throw exception(
          ExceptionType.response,
          _response.exception.toString(),
        );
      }

      if (_response.data != null) {
        return Data.fromMap(_response.data['characters']);
      }

      throw exception(
        ExceptionType.server,
        'Se ha producido un error al contactar con el servidor',
      );
    } catch (e) {
      throw exception(ExceptionType.graphql, e);
    }
  }
}
