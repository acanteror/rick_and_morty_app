import 'package:rick_and_morty_app/features/character_detail/domain/models/character_detail_viewmodel.dart';

import '../../../../characters/domain/models/fakes/character_fake.dart';
import '../../../infraestructure/dto/fakes/episode_fake.dart';

CharacterDetailViewModel tCharacterDetailViewModel = CharacterDetailViewModel(
  character: tCharacter,
  episodes: [tEpisode],
);
