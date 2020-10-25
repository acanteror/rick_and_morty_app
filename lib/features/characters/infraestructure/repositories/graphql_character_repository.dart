import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/exception/exception_logger.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/data_sources/characters_data_source.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/dto/data.dart';

class GraphQLCharactersRepository extends CharactersRepository with ExceptionLogger {
  final CharactersDataSource _dataSource;

  GraphQLCharactersRepository({
    CharactersDataSource dataSource,
  }) : _dataSource = dataSource ?? Get.find();

  Future<Data> fetchCharacters() async {
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
  }
}
