import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';

import 'fakes/character_fake.dart';
import '../../../../fixture_reader.dart';

void main() {
  group('characters', () {
    test(
      'Result fromJson should return a valid model',
      () async {
        final Map<String, dynamic> _jsonMap = json.decode(
          fixture(
            'characters',
            'domain/models',
            'character.json',
          ),
        ) as Map<String, dynamic>;

        final Character _result = Character.fromMap(_jsonMap);

        expect(_result, tCharacter);
      },
    );
  });
}
