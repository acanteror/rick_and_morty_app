import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/model/info_model.dart';
import 'package:rick_and_morty_app/model/result_model.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@immutable
abstract class Data with _$Data {
  const factory Data(Info info, List<Result> results) = _Data;
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
