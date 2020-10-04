import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/use_cases/bloc/characters_bloc.dart';

import '../../../infraestructure/models/fakes/data_fake.dart';
import 'character_state_fake.dart';

class MockCharactersBloc extends MockBloc<CharactersState> implements CharactersBloc {}

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  CharactersBloc charactersBloc;
  CharactersRepository charactersRepository;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    charactersRepository = MockCharactersRepository();
    charactersBloc = CharactersBloc(charactersRepository: charactersRepository);
  });

  tearDown(() {
    charactersBloc?.close();
  });

  group('whenListen', () {
    test("Let's mock the CharactersBloc's stream!", () {
      final _mockedBloc = MockCharactersBloc();

      whenListen(
          _mockedBloc,
          Stream.fromIterable([
            tCharactersInitial,
            tCharactersLoading,
            tCharactersLoaded,
            tCharactersError,
          ]));

      expectLater(
          _mockedBloc,
          emitsInOrder(<CharactersState>[
            tCharactersInitial,
            tCharactersLoading,
            tCharactersLoaded,
            tCharactersError,
          ]));
    });
  });

  group('CharacterBloc', () {
    blocTest<CharactersBloc, CharactersState>(
      'emits [] when nothing is added',
      build: () => charactersBloc,
      expect: [],
    );

    test('has a correct initialState', () {
      expect(charactersBloc.state, tCharactersInitial);
    });

    blocTest<CharactersBloc, CharactersState>(
      'emits [tCharactersLoading, tCharactersSuccess] when CharactersFetch event is added and charactersRepository returns correct Data',
      build: () {
        when(charactersRepository.fetchCharacters()).thenAnswer((_) async => tData);
        return charactersBloc;
      },
      act: (bloc) async => bloc.add(CharactersFetch()),
      expect: <CharactersState>[tCharactersLoading, tCharactersLoaded],
    );

    blocTest<CharactersBloc, CharactersState>(
      'emits [tCharactersLoading, tCharactersError] when CharactersFetch event is added and charactersRepository returns Exception',
      build: () {
        when(charactersRepository.fetchCharacters()).thenThrow(Exception());
        return charactersBloc;
      },
      act: (bloc) async => bloc.add(CharactersFetch()),
      expect: <CharactersState>[tCharactersLoading, tCharactersError],
    );
  });
}
