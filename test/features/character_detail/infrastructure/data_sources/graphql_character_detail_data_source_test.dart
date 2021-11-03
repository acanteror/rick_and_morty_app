import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty_app/features/character_detail/infrastructure/data_sources/character_detail_datasource.dart';

import '../../../../helpers.dart';
import 'fake_data.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  HttpLink httpLink;
  Link link;
  GraphQLClient graphQLClientClient;
  MockHttpClient mockHttpClient;
  CharacterDetailDataSource dataSource;
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
        GraphQLCharacterDetailDataSource(graphQLClient: graphQLClientClient);
  });

  group('character detail', () {
    test(
      'fetchCharacterDetail should return a valid characterDetailData...',
      () async {
        when(mockHttpClient.send(any)).thenAnswer(
          (_) async => simpleResponse(
            body: characterDetailResponse,
          ),
        );
        final actual = await dataSource.fetchCharacterDetail("1");
        final expected = QueryResult(
          data: json.decode(characterDetailData),
        );
        expect(actual.data, expected.data);
        //verify(dataSource.fetchCharacterDetail("1")).called(1);
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
