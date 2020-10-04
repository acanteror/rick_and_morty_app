import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/info/info_model.dart';

import 'fakes/info_fake.dart';
import 'fixtures/fixture_reader.dart';

void main() {
  group('characters', () {
    test(
      'Info fromJson should return a valid model',
      () async {
        final Map<String, dynamic> _jsonMap = json.decode(fixture('info.json')) as Map<String, dynamic>;

        final Info _result = Info.fromJson(_jsonMap);

        expect(_result, tInfo);
      },
    );
  });
}
