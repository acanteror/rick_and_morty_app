import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@immutable
abstract class Result with _$Result {
  const factory Result(String id, String name, String status, String species,
      String type, String gender, String image) = _Result;
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

// class Result {
//     String id;
//     String name;
//     String status;
//     String species;
//     String type;
//     String gender;
//     String image;
//     Origin origin;

//     Result({
//         this.id,
//         this.name,
//         this.status,
//         this.species,
//         this.type,
//         this.gender,
//         this.image,
//         this.origin,
//     });
// }
