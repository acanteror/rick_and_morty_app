import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/dto/character_detail.dart';

import '../../../../fixture_reader.dart';
import 'fakes/character_detail_fake.dart';

void main() {
  group('character detail', () {
    test(
      'CharacterDetail fromMap should return a valid model',
      () async {
        final Map<String, dynamic> _jsonMap = json.decode(
          fixture(
            'character_detail',
            'infraestructure/dto',
            'character_detail.json',
          ),
        ) as Map<String, dynamic>;

        final CharacterDetail _result = CharacterDetail.fromMap(_jsonMap);

        expect(_result, tCharacterDetail);
      },
    );
  });
}
