import 'dart:convert';

class Episode {
  String id;
  String name;
  String airDate;
  String episode;
  Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
  });

  Episode copyWith({
    String id,
    String name,
    String airDate,
    String episode,
  }) {
    return Episode(
      id: id ?? this.id,
      name: name ?? this.name,
      airDate: airDate ?? this.airDate,
      episode: episode ?? this.episode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'air_date': airDate,
      'episode': episode,
    };
  }

  factory Episode.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Episode(
      id: map['id'],
      name: map['name'],
      airDate: map['air_date'],
      episode: map['episode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Episode.fromJson(String source) => Episode.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Episode(id: $id, name: $name, air_date: $airDate, episode: $episode)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Episode && o.id == id && o.name == name && o.airDate == airDate && o.episode == episode;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ airDate.hashCode ^ episode.hashCode;
  }
}
