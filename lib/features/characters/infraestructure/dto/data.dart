import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/dto/info.dart';
import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';

class Data {
  final Info info;
  final List<Character> results;
  Data({
    this.info,
    this.results,
  });

  Data copyWith({
    Info info,
    List<Character> results,
  }) {
    return Data(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info?.toMap(),
      'results': results?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      info: Info.fromMap(map['info']),
      results: List<Character>.from(map['results']?.map((x) => Character.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(info: $info, results: $results)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data && o.info == info && listEquals(o.results, results);
  }

  @override
  int get hashCode => info.hashCode ^ results.hashCode;
}
