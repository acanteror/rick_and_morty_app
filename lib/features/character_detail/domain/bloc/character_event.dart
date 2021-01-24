part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class CharacterFetch extends CharacterEvent {
  final String id;

  const CharacterFetch({this.id});

  @override
  List<Object> get props => [id];
}
