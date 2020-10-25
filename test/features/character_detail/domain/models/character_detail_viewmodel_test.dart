import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/models/character_detail_viewmodel.dart';
import '../../infraestructure/dto/fakes/character_detail_fake.dart';
import 'fakes/character_detail_viewmodel_fake.dart';

void main() {
  group('character detail', () {
    test(
      'CharacterDetailViewModel fromDTO should return a valid viewmodel',
      () async {
        final CharacterDetailViewModel _result = CharacterDetailViewModel.fromDTO(tCharacterDetail);

        expect(_result, tCharacterDetailViewModel);
      },
    );
  });
}
