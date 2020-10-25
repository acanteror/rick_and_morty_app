import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/dto/info.dart';

import 'fakes/info_fake.dart';
import '../../../../fixture_reader.dart';

void main() {
  group('characters', () {
    test(
      'Info fromJson should return a valid model',
      () async {
        final Map<String, dynamic> _jsonMap = json.decode(
          fixture(
            'characters',
            'infraestructure/dto',
            'info.json',
          ),
        ) as Map<String, dynamic>;

        final Info _result = Info.fromMap(_jsonMap);

        expect(_result, tInfo);
      },
    );
  });
}
