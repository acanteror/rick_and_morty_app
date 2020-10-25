import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/dto/character_detail.dart';
import 'package:rick_and_morty_app/features/character_detail/infraestructure/dto/episode.dart';
import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';

class CharacterDetailViewModel {
  final Character character;
  final List<Episode> episodes;
  CharacterDetailViewModel({
    this.character,
    this.episodes,
  });

  CharacterDetailViewModel copyWith({
    Character character,
    List<Episode> episodes,
  }) {
    return CharacterDetailViewModel(
      character: character ?? this.character,
      episodes: episodes ?? this.episodes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'character': character?.toMap(),
      'episodes': episodes?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory CharacterDetailViewModel.fromDTO(CharacterDetail characterDetail) {
    if (characterDetail == null) return null;

    return CharacterDetailViewModel(
      character: Character(
        id: characterDetail.id,
        name: characterDetail.name,
        status: characterDetail.status,
        species: characterDetail.species,
        type: characterDetail.type,
        gender: characterDetail.gender,
        image: characterDetail.image,
      ),
      episodes: characterDetail.episodes,
    );
  }

  factory CharacterDetailViewModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CharacterDetailViewModel(
      character: Character.fromMap(map['character']),
      episodes: List<Episode>.from(map['episodes']?.map((x) => Episode.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDetailViewModel.fromJson(String source) => CharacterDetailViewModel.fromMap(json.decode(source));

  @override
  String toString() => 'CharacterDetailViewModel(character: $character, episodes: $episodes)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CharacterDetailViewModel && o.character == character && listEquals(o.episodes, episodes);
  }

  @override
  int get hashCode => character.hashCode ^ episodes.hashCode;
}
