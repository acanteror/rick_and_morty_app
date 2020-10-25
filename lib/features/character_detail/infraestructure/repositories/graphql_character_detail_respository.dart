import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/exception/exception_logger.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/models/character_detail_viewmodel.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repositories/character_detail_repository.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/data_sources/character_detail_datasource.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/dto/character_detail.dart';

class GraphQLCharacterDetailRepository extends CharacterDetailRepository with ExceptionLogger {
  final CharacterDetailDataSource _dataSource;

  GraphQLCharacterDetailRepository({
    CharacterDetailDataSource dataSource,
  }) : _dataSource = dataSource ?? Get.find();

  Future<CharacterDetailViewModel> fetchCharacterDetail(String id) async {
    QueryResult _response = await _dataSource.fetchCharacterDetail(id);

    if (_response.exception != null) {
      throw exception(
        ExceptionType.response,
        _response.exception.toString(),
      );
    }

    if (_response.data != null) {
      final CharacterDetail _characterDetailResponse = CharacterDetail.fromMap(_response.data['character']);
      return CharacterDetailViewModel.fromDTO(_characterDetailResponse);
    }

    throw exception(
      ExceptionType.server,
      'Se ha producido un error al contactar con el servidor',
    );
  }
}
