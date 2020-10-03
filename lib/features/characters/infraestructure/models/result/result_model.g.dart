// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Result _$_$_ResultFromJson(Map<String, dynamic> json) {
  return _$_Result(
    json['id'] as String,
    json['name'] as String,
    json['status'] as String,
    json['species'] as String,
    json['type'] as String,
    json['gender'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$_$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
    };
