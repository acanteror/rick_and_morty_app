part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
}

class CharacterInitial extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterLoading extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError({this.message});

  @override
  List<Object> get props => [message];
}

class CharacterLoaded extends CharacterState {
  final List<Result> characters;

  CharacterLoaded({this.characters});

  @override
  List<Object> get props => [characters];
}
