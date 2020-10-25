import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/dto/episode.dart';

import '../../../../fixture_reader.dart';
import 'fakes/episode_fake.dart';

void main() {
  group('character detail', () {
    test(
      'Episode fromJson should return a valid model',
      () async {
        final Map<String, dynamic> _jsonMap = json.decode(
          fixture(
            'character_detail',
            'infraestructure/dto',
            'episode.json',
          ),
        ) as Map<String, dynamic>;

        final Episode _result = Episode.fromMap(_jsonMap);

        expect(_result, tEpisode);
      },
    );
  });
}
