// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

abstract class _$Data {
  dynamic get info;
  List<dynamic> get results;

  Data copyWith({dynamic info, List<dynamic> results});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(this.info, this.results);

  factory _$_Data.fromJson(Map<String, dynamic> json) =>
      _$_$_DataFromJson(json);

  @override
  final dynamic info;
  @override
  final List<dynamic> results;

  @override
  String toString() {
    return 'Data(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Data &&
        (identical(other.info, info) || other.info == info) &&
        (identical(other.results, results) || other.results == results);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ info.hashCode ^ results.hashCode;

  @override
  _$_Data copyWith({
    Object info = immutable,
    Object results = immutable,
  }) {
    return _$_Data(
      info == immutable ? this.info : info as dynamic,
      results == immutable ? this.results : results as List<dynamic>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DataToJson(this);
  }
}

abstract class _Data implements Data {
  const factory _Data(dynamic info, List<dynamic> results) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  dynamic get info;
  @override
  List<dynamic> get results;

  @override
  _Data copyWith({dynamic info, List<dynamic> results});
}
