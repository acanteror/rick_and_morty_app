import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty_app/exception/custom_exception.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infrastructure/data_sources/characters_data_source.dart';
import 'package:rick_and_morty_app/features/characters/infrastructure/dto/data.dart';
import 'package:rick_and_morty_app/features/characters/infrastructure/repositories/graphql_character_repository.dart';

import '../dto/fakes/data_fake.dart';
import 'fake_responses.dart';

class MockCharactersDataSource extends Mock implements CharactersDataSource {}

void main() {
  CharactersRepository charactersRepository;
  CharactersDataSource charactersDataSource;

  setUp(() {
    charactersDataSource = MockCharactersDataSource();
    charactersRepository =
        GraphQLCharactersRepository(dataSource: charactersDataSource);
  });

  group('characters', () {
    test('should return Data when repository calls dataSource.fetchCharacters',
        () async {
      when(charactersDataSource.fetchCharacters())
          .thenAnswer((_) async => tCharactersResponse);
      final Data _actual = await charactersRepository.fetchCharacters();
      final _expected = tData;
      expect(_actual, _expected);
      verify(charactersDataSource.fetchCharacters()).called(1);
    });

    test('should throw response exception when api return object with errors',
        () async {
      when(charactersDataSource.fetchCharacters())
          .thenAnswer((_) async => tResponseWithErrors);
      final _call = charactersRepository.fetchCharacters;

      expect(_call(), throwsA(predicate((e) => e is ResponseException)));
      verify(charactersDataSource.fetchCharacters()).called(1);
    });

    test('should throw server exception when api doesn´t respond', () async {
      when(charactersDataSource.fetchCharacters())
          .thenAnswer((_) async => QueryResult(
                data: null,
                exception: null,
              ));
      final _call = charactersRepository.fetchCharacters;

      expect(_call(), throwsA(predicate((e) => e is ServerException)));
      verify(charactersDataSource.fetchCharacters()).called(1);
    });
  });
}
