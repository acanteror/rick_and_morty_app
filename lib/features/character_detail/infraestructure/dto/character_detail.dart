import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rick_and_morty_app/features/character_detail/infraestructure/dto/episode.dart';

class CharacterDetail {
  final String id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final List<Episode> episodes;
  CharacterDetail({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.episodes,
  });

  CharacterDetail copyWith({
    String id,
    String name,
    String status,
    String species,
    String type,
    String gender,
    String image,
    List<Episode> episodes,
  }) {
    return CharacterDetail(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      episodes: episodes ?? this.episodes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'image': image,
      'episode': episodes?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory CharacterDetail.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CharacterDetail(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      image: map['image'],
      episodes:
          (map['episode'] as List)?.map((x) => x == null ? null : Episode.fromMap(x as Map<String, dynamic>))?.toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDetail.fromJson(String source) => CharacterDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharacterDetail(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, image: $image, episode: $episodes)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CharacterDetail &&
        o.id == id &&
        o.name == name &&
        o.status == status &&
        o.species == species &&
        o.type == type &&
        o.gender == gender &&
        o.image == image &&
        listEquals(o.episodes, episodes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        image.hashCode ^
        episodes.hashCode;
  }
}
