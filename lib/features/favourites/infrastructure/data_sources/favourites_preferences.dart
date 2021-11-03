import 'package:shared_preferences/shared_preferences.dart';

class FavouritesPreferences {
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

  List<String> get favourites {
    return _prefs.getStringList('favourites');
  }

  set favourites(List<String> value) {
    _prefs.setStringList('favourites', value);
  }

  void clear() {
    _prefs.clear();
  }
}
