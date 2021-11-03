part of 'favourites_bloc.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();
}

class FavouritesInitial extends FavouritesState {
  final List<bool> favourites;

  FavouritesInitial({this.favourites});

  @override
  List<Object> get props => [favourites];
}

class FavouritesSuccess extends FavouritesState {
  final List<bool> favourites;

  FavouritesSuccess({this.favourites});

  @override
  List<Object> get props => [favourites];
}
