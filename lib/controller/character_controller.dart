import 'package:get/get.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:rick_and_morty_app/model/data/data_model.dart';
import 'package:rick_and_morty_app/service/character_service.dart';

class CharacterController extends GetxController {
  CharacterService characterService;

  CharacterController({characterService})
      : this.characterService = characterService ?? Get.find();

  static CharacterController get to => Get.find(); // add this line

  Data data;
  void fetchData() async {
    data = await characterService.fetchCharacters();
    logWarning(data.info);
    logWarning(data.results.length.toString());
    update();
  }
}
