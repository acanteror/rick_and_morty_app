import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/dto/data.dart';

import 'fakes/data_fake.dart';
import '../../../../fixture_reader.dart';

void main() {
  group('characters', () {
    test(
      'Data fromJson should return a valid model',
      () async {
        final Map<String, dynamic> _jsonMap = json.decode(
          fixture(
            'characters',
            'infraestructure/dto',
            'data.json',
          ),
        ) as Map<String, dynamic>;

        final Data _result = Data.fromMap(_jsonMap);

        expect(_result, tData);
      },
    );
  });
}
