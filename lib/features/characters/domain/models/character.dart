import 'dart:convert';

class Character {
  final String id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
  });

  Character copyWith({
    String id,
    String name,
    String status,
    String species,
    String type,
    String gender,
    String image,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      image: image ?? this.image,
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
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Character(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) => Character.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Character &&
        o.id == id &&
        o.name == name &&
        o.status == status &&
        o.species == species &&
        o.type == type &&
        o.gender == gender &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        image.hashCode;
  }
}
