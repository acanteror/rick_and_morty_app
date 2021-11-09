import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/favourites/domain/repositories/favourites_repository.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FavouritesRepository _favouritesRepository;

  FavouritesBloc({favouritesRepository})
      : _favouritesRepository =
            favouritesRepository ?? Get.find<FavouritesRepository>(),
        super(FavouritesInitial());

  @override
  Stream<FavouritesState> mapEventToState(
    FavouritesEvent event,
  ) async* {
    if (event is FavouritesFetch) {
      try {
        final List<String> _favourites =
            await _favouritesRepository.fetchFavourites();
        yield FavouritesSuccess(favourites: _favourites);
      } catch (e) {
        yield FavouritesError();
      }
    }

    if (event is FavouritesToggle) {
      try {
        final List<String> _favourites =
            await _favouritesRepository.toggleFavourite(event.id);
        yield FavouritesSuccess(favourites: _favourites);
      } catch (e) {
        yield FavouritesError();
      }
    }
  }
}
