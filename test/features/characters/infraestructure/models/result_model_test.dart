import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/result.dart';

import 'fakes/result_fake.dart';
import '../../../../fixture_reader.dart';

void main() {
  group('characters', () {
    test(
      'Result fromJson should return a valid model',
      () async {
        final Map<String, dynamic> _jsonMap = json.decode(
          fixture(
            'characters',
            'result.json',
          ),
        ) as Map<String, dynamic>;

        final Result _result = Result.fromMap(_jsonMap);

        expect(_result, tResult);
      },
    );
  });
}
