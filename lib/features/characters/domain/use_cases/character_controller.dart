import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/data/data_model.dart';

class CharacterController extends GetxController {
  final CharactersRepository characterService;

  CharacterController({characterService}) : this.characterService = characterService ?? Get.find();

  static CharacterController get to => Get.find();

  Data data;

  void fetchData() async {
    data = await characterService.fetchCharacters();
    print(data.toString());
    update();
  }
}
