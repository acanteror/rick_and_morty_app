part of 'character_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();
}

class CharacterInitial extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharacterLoading extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharacterError extends CharactersState {
  final String message;

  CharacterError({this.message});

  @override
  List<Object> get props => [message];
}

class CharacterLoaded extends CharactersState {
  final List<Result> characters;

  CharacterLoaded({this.characters});

  @override
  List<Object> get props => [characters];
}
