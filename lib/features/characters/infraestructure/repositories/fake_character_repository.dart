import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/dto/data.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/dto/info.dart';

class FakeCharactersRepository extends CharactersRepository {
  FakeCharactersRepository();

  Future<Data> fetchCharacters() async {
    await Future.delayed(const Duration(seconds: 4));
    return fData;
  }
}

final Data fData = Data(
  info: fInfo,
  results: fCharacters,
);

final Info fInfo = Info(
  count: 30,
  pages: 1,
  next: 2,
  prev: null,
);

final List<Character> fCharacters = [
  fCharacter1,
  fCharacter2,
  fCharacter3,
  fCharacter4,
  fCharacter5,
  fCharacter6,
  fCharacter7,
  fCharacter8,
  fCharacter9,
];

final Character fCharacter1 = Character(
  id: '1',
  name: 'name1',
  status: 'status1',
  species: 'species1',
  type: 'type1',
  gender: 'gender1',
  image: 'https://picsum.photos/id/10/90',
);

final Character fCharacter2 = Character(
  id: '2',
  name: 'name2',
  status: 'status2',
  species: 'species2',
  type: 'type2',
  gender: 'gender2',
  image: 'https://picsum.photos/id/20/90',
);

final Character fCharacter3 = Character(
  id: '3',
  name: 'name3',
  status: 'status3',
  species: 'species3',
  type: 'type3',
  gender: 'gender3',
  image: 'https://picsum.photos/id/30/90',
);

final Character fCharacter4 = Character(
  id: '4',
  name: 'name4',
  status: 'status4',
  species: 'species4',
  type: 'type4',
  gender: 'gender4',
  image: 'https://picsum.photos/id/40/90',
);

final Character fCharacter5 = Character(
  id: '5',
  name: 'name5',
  status: 'status5',
  species: 'species5',
  type: 'type5',
  gender: 'gender5',
  image: 'https://picsum.photos/id/50/90',
);

final Character fCharacter6 = Character(
  id: '6',
  name: 'name6',
  status: 'status6',
  species: 'species6',
  type: 'type6',
  gender: 'gender6',
  image: 'https://picsum.photos/id/60/90',
);

final Character fCharacter7 = Character(
  id: '7',
  name: 'name7',
  status: 'status7',
  species: 'species7',
  type: 'type7',
  gender: 'gender7',
  image: 'https://picsum.photos/id/70/90',
);

final Character fCharacter8 = Character(
  id: '8',
  name: 'name8',
  status: 'status8',
  species: 'species8',
  type: 'type8',
  gender: 'gender8',
  image: 'https://picsum.photos/id/80/90',
);

final Character fCharacter9 = Character(
  id: '9',
  name: 'name9',
  status: 'status9',
  species: 'species9',
  type: 'type9',
  gender: 'gender9',
  image: 'https://picsum.photos/id/90/90',
);
