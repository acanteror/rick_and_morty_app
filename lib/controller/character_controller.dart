import 'package:get/get.dart';
import 'package:rick_and_morty_app/model/data/data_model.dart';
import 'package:rick_and_morty_app/service/character_service.dart';

class CharacterController extends GetxController {
  final CharacterService characterService;

  CharacterController({characterService})
      : this.characterService = characterService ?? Get.find();

  static CharacterController get to => Get.find();

  Data data;
  void fetchData() async {
    data = await characterService.fetchCharacters();
    print(data.toString());
    update();
  }
}
