// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

abstract class _$Result {
  String get id;
  String get name;
  String get status;
  String get species;
  String get type;
  String get gender;
  String get image;

  Result copyWith(
      {String id,
      String name,
      String status,
      String species,
      String type,
      String gender,
      String image});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(this.id, this.name, this.status, this.species, this.type,
      this.gender, this.image);

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$_$_ResultFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String species;
  @override
  final String type;
  @override
  final String gender;
  @override
  final String image;

  @override
  String toString() {
    return 'Result(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Result &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.name, name) || other.name == name) &&
        (identical(other.status, status) || other.status == status) &&
        (identical(other.species, species) || other.species == species) &&
        (identical(other.type, type) || other.type == type) &&
        (identical(other.gender, gender) || other.gender == gender) &&
        (identical(other.image, image) || other.image == image);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      name.hashCode ^
      status.hashCode ^
      species.hashCode ^
      type.hashCode ^
      gender.hashCode ^
      image.hashCode;

  @override
  _$_Result copyWith({
    Object id = immutable,
    Object name = immutable,
    Object status = immutable,
    Object species = immutable,
    Object type = immutable,
    Object gender = immutable,
    Object image = immutable,
  }) {
    return _$_Result(
      id == immutable ? this.id : id as String,
      name == immutable ? this.name : name as String,
      status == immutable ? this.status : status as String,
      species == immutable ? this.species : species as String,
      type == immutable ? this.type : type as String,
      gender == immutable ? this.gender : gender as String,
      image == immutable ? this.image : image as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResultToJson(this);
  }
}

abstract class _Result implements Result {
  const factory _Result(String id, String name, String status, String species,
      String type, String gender, String image) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get status;
  @override
  String get species;
  @override
  String get type;
  @override
  String get gender;
  @override
  String get image;

  @override
  _Result copyWith(
      {String id,
      String name,
      String status,
      String species,
      String type,
      String gender,
      String image});
}
