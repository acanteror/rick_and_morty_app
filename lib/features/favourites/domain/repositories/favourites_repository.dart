abstract class FavouritesRepository {
  Future<List<String>> fetchFavourites();
  Future<void> insertFavourite(String id);
  Future<void> removeFavourite(String id);
}
