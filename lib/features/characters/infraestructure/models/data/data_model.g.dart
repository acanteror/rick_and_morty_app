// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Data _$_$_DataFromJson(Map<String, dynamic> json) {
  return _$_Data(
    json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_DataToJson(_$_Data instance) => <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
