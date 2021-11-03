import 'package:get/get.dart';
import 'package:rick_and_morty_app/exception/exception_logger.dart';
import 'package:rick_and_morty_app/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:rick_and_morty_app/features/favourites/infrastructure/data_sources/favourites_preferences.dart';

class SharedPreferencesFavouritesRepository
    with ExceptionLogger
    implements FavouritesRepository {
  final FavouritesPreferences _dataSource;

  SharedPreferencesFavouritesRepository({
    FavouritesPreferences dataSource,
  }) : _dataSource = dataSource ?? Get.find();

  @override
  Future<List<String>> fetchFavourites() async {
    List<String> _favourites = await _dataSource.favourites;

    if (_favourites != null) {
      return _favourites;
    }

    throw exception(
      ExceptionType.server,
      'Server error',
    );
  }

  @override
  Future<void> insertFavourite(String id) {
    // TODO: implement insertFavourite
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavourite(String id) {
    // TODO: implement removeFavourite
    throw UnimplementedError();
  }
}
