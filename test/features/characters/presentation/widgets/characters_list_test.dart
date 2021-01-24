import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_and_morty_app/features/characters/domain/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_list.dart';

import '../../domain/bloc/character_state_fake.dart';

class MockCharactersBloc extends MockBloc<CharactersState> implements CharactersBloc {}

void main() {
  CharactersBloc mockCharacterBloc;

  setUp(() {
    mockCharacterBloc = MockCharactersBloc();
  });

  testWidgets('CharactersList should show a initial message when charactersBloc emit CharactersInitial',
      (WidgetTester tester) async {
    Widget _charactersList = Directionality(
      child: MediaQuery(
        data: MediaQueryData(),
        child: CharactersList(charactersBloc: mockCharacterBloc),
      ),
      textDirection: TextDirection.ltr,
    );
    await tester.pumpWidget(_charactersList);

    final noCharactersFinder = find.byKey(Key('initialMessage'));
    final loadingFinder = find.byKey(Key('loading'));
    expect(noCharactersFinder, findsOneWidget);
    expect(loadingFinder, findsNothing);
  });

  testWidgets('CharactersList should show a loadingProgressInidicator when charactersBloc emit CharactersLoading',
      (WidgetTester tester) async {
    Widget _charactersList = Directionality(
      child: MediaQuery(
        data: MediaQueryData(),
        child: CharactersList(charactersBloc: mockCharacterBloc),
      ),
      textDirection: TextDirection.ltr,
    );

    when(mockCharacterBloc.state).thenReturn(tCharactersLoading);
    await tester.pumpWidget(_charactersList);

    final noCharactersFinder = find.byKey(Key('initialMessage'));
    final loadingFinder = find.byKey(Key('loading'));
    expect(noCharactersFinder, findsNothing);
    expect(loadingFinder, findsOneWidget);
  });

  testWidgets('CharactersList should show a list of CharacterListItems when charactersBloc emit CharactersLoaded',
      (WidgetTester tester) async {
    Widget _charactersList = Directionality(
      child: MediaQuery(
        data: MediaQueryData(),
        child: CharactersList(charactersBloc: mockCharacterBloc),
      ),
      textDirection: TextDirection.ltr,
    );

    when(mockCharacterBloc.state).thenReturn(tCharactersLoaded);
    await mockNetworkImagesFor(() async => await tester.pumpWidget(_charactersList));

    final noCharactersFinder = find.byKey(Key('initialMessage'));
    final loadingFinder = find.byKey(Key('loading'));
    final characterListItem = find.byKey(Key('characterListItem'));
    expect(noCharactersFinder, findsNothing);
    expect(loadingFinder, findsNothing);
    expect(characterListItem, findsNWidgets(tCharactersLoaded.characters.length));
  });

  testWidgets('CharactersList should show a error message when charactersBloc emit CharactersError',
      (WidgetTester tester) async {
    Widget _charactersList = Directionality(
      child: MediaQuery(
        data: MediaQueryData(),
        child: CharactersList(charactersBloc: mockCharacterBloc),
      ),
      textDirection: TextDirection.ltr,
    );

    when(mockCharacterBloc.state).thenReturn(tCharactersError);
    await tester.pumpWidget(_charactersList);

    final errorFinder = find.byKey(Key('errorMessage'));
    expect(errorFinder, findsOneWidget);
  });
}
