import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty_app/features/characters/infrastructure/data_sources/characters_data_source.dart';

import '../../../../helpers.dart';
import 'fake_data.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  HttpLink httpLink;
  Link link;
  GraphQLClient graphQLClientClient;
  MockHttpClient mockHttpClient;
  CharactersDataSource dataSource;
  setUp(() {
    mockHttpClient = MockHttpClient();

    httpLink =
        HttpLink(uri: 'https://test.com/graphql', httpClient: mockHttpClient);

    link = getMyAuthLink().concat(httpLink);

    graphQLClientClient = GraphQLClient(
      cache: getTestCache(),
      link: link,
    );

    dataSource =
        GraphQLCharactersDataSource(graphQLClient: graphQLClientClient);
  });

  group('characters', () {
    test(
      'fetchCharacters should return a valid charactersData...',
      () async {
        when(mockHttpClient.send(any)).thenAnswer(
          (_) async => simpleResponse(
            body: charactersResponse,
          ),
        );
        final actual = await dataSource.fetchCharacters();
        final expected = QueryResult(
          data: json.decode(charactersData),
        );
        expect(actual.data, expected.data);
      },
    );

    // test(
    //   'fetchCharacters should throw graphql exception if graphql client call throw some exception',
    //   () async {
    //     when(mockHttpClient.send(any)).thenThrow((exception) async => GraphQLException(exception.toString()));
    //     final _call = dataSource.fetchCharacters;
    //     expect(_call(), throwsA(isA<GraphQLException>()));
    //     verify(dataSource.fetchCharacters()).called(1);
    //   },
    // );
  });
}
