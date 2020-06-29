// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

abstract class _$Data {
  Info get info;
  List<Result> get results;

  Data copyWith({Info info, List<Result> results});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(this.info, this.results);

  factory _$_Data.fromJson(Map<String, dynamic> json) =>
      _$_$_DataFromJson(json);

  @override
  final Info info;
  @override
  final List<Result> results;

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
      info == immutable ? this.info : info as Info,
      results == immutable ? this.results : results as List<Result>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DataToJson(this);
  }
}

abstract class _Data implements Data {
  const factory _Data(Info info, List<Result> results) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  Info get info;
  @override
  List<Result> get results;

  @override
  _Data copyWith({Info info, List<Result> results});
}
