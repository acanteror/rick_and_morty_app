import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:rick_and_morty_app/features/favourites/infrastructure/data_sources/favourites_preferences.dart';

class SharedPreferencesFavouritesRepository implements FavouritesRepository {
  final FavouritesPreferences _dataSource;

  SharedPreferencesFavouritesRepository({
    FavouritesPreferences dataSource,
  }) : _dataSource = dataSource ?? Get.find();

  @override
  List<String> fetchFavourites() {
    _dataSource.initPrefs();
    List<String> _favourites = _dataSource.getFavourites() ?? <String>[];

    return _favourites;
  }

  @override
  List<String> toggleFavourite(String id) {
    List<String> _favourites = _dataSource.getFavourites() ?? <String>[];

    if (!_favourites.contains(id)) {
      _favourites.add(id);
    } else {
      _favourites.remove(id);
    }

    return updatedFavourites(_favourites);
  }

  List<String> updatedFavourites(List<String> favourites) {
    _dataSource.setFavourites(favourites);
    return favourites;
  }
}
