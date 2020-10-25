part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();
}

class CharactersInitial extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersLoading extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError({this.message});

  @override
  List<Object> get props => [message];
}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded({this.characters});

  @override
  List<Object> get props => [characters];
}
