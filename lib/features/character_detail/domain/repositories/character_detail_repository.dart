import 'package:rick_and_morty_app/features/character_detail/domain/models/character_detail_viewmodel.dart';

abstract class CharacterDetailRepository {
  Future<CharacterDetailViewModel> fetchCharacterDetail(String id);
}
