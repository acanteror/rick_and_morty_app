import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/favourites/domain/repositories/favourites_repository.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FavouritesRepository _favouritesRepository;

  FavouritesBloc({characterRepository})
      : _favouritesRepository =
            characterRepository ?? Get.find<FavouritesRepository>(),
        super(FavouritesInitial());

  @override
  Stream<FavouritesState> mapEventToState(
    FavouritesEvent event,
  ) async* {
    if (event is FavouritesToggle) {
      try {
        //final CharacterDetailViewModel _response =
        //    await _favouritesRepository.(event.id);
        //yield CharacterLoaded(characterDetail: _response);
      } catch (e) {
        //yield CharacterError(message: e.toString());
      }
    }
  }
}
