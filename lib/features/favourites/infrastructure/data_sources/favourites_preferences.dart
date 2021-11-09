import 'package:shared_preferences/shared_preferences.dart';

class FavouritesPreferences {
  static const String favouritesKey = 'favourites';

  static final FavouritesPreferences _getInstance =
      FavouritesPreferences._internal();

  factory FavouritesPreferences() {
    return _getInstance;
  }

  FavouritesPreferences._internal();

  SharedPreferences _prefs;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<String> getFavourites() {
    return _prefs.getStringList(favouritesKey);
  }

  List<String> setFavourites(List<String> value) {
    _prefs.setStringList(favouritesKey, value);
    return _prefs.getStringList(favouritesKey);
  }

  void clear() {
    _prefs.clear();
  }
}
