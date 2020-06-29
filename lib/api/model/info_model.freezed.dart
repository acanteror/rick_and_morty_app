// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return _Info.fromJson(json);
}

abstract class _$Info {
  int get count;
  int get pages;
  int get next;
  int get prev;

  Info copyWith({int count, int pages, int next, int prev});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Info implements _Info {
  const _$_Info(this.count, this.pages, this.next, this.prev);

  factory _$_Info.fromJson(Map<String, dynamic> json) =>
      _$_$_InfoFromJson(json);

  @override
  final int count;
  @override
  final int pages;
  @override
  final int next;
  @override
  final int prev;

  @override
  String toString() {
    return 'Info(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Info &&
        (identical(other.count, count) || other.count == count) &&
        (identical(other.pages, pages) || other.pages == pages) &&
        (identical(other.next, next) || other.next == next) &&
        (identical(other.prev, prev) || other.prev == prev);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      count.hashCode ^
      pages.hashCode ^
      next.hashCode ^
      prev.hashCode;

  @override
  _$_Info copyWith({
    Object count = immutable,
    Object pages = immutable,
    Object next = immutable,
    Object prev = immutable,
  }) {
    return _$_Info(
      count == immutable ? this.count : count as int,
      pages == immutable ? this.pages : pages as int,
      next == immutable ? this.next : next as int,
      prev == immutable ? this.prev : prev as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InfoToJson(this);
  }
}

abstract class _Info implements Info {
  const factory _Info(int count, int pages, int next, int prev) = _$_Info;

  factory _Info.fromJson(Map<String, dynamic> json) = _$_Info.fromJson;

  @override
  int get count;
  @override
  int get pages;
  @override
  int get next;
  @override
  int get prev;

  @override
  _Info copyWith({int count, int pages, int next, int prev});
}
