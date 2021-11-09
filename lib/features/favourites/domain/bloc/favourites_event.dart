part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class FavouritesFetch extends FavouritesEvent {
  const FavouritesFetch();

  @override
  List<Object> get props => [];
}

class FavouritesToggle extends FavouritesEvent {
  final String id;

  const FavouritesToggle({this.id});

  @override
  List<Object> get props => [id];
}
