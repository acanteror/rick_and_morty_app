import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@immutable
abstract class Info with _$Info {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Info(
    int count,
    int pages,
    int next,
    int prev,
  ) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}
