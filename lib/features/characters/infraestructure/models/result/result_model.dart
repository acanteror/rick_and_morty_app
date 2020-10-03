import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@immutable
abstract class Result with _$Result {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Result(
    String id,
    String name,
    String status,
    String species,
    String type,
    String gender,
    String image,
  ) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}