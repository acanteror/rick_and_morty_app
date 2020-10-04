import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/characters/domain/use_cases/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/pages/characters_page.dart';

class MockCharactersBloc extends MockBloc<CharactersState> implements CharactersBloc {}

void main() {
  CharactersBloc mockCharacterBloc;

  setUp(() {
    mockCharacterBloc = MockCharactersBloc();
  });

  testWidgets('CharactersPage should have: an appbar, a body and a fab', (WidgetTester tester) async {
    Widget charactersPage = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: CharactersPage(
          charactersBloc: mockCharacterBloc,
        ),
      ),
    );

    await tester.pumpWidget(charactersPage);

    final appBarFinder = find.byKey(Key('charactersPageAppBar'));
    final bodyFinder = find.byKey(Key('charactersPageBody'));
    final fabFinder = find.byKey(Key('charactersPageFAB'));
    expect(appBarFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
    expect(fabFinder, findsOneWidget);
  });
}
