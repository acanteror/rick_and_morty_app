import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_list_item.dart';
import '../../infraestructure/dto/fakes/data_fake.dart';

void main() {
  testWidgets('CharactersListItem should ...', (WidgetTester tester) async {
    final _character = tData.results[0];
    Widget _charactersListItem = Directionality(
      child: MediaQuery(
        data: MediaQueryData(),
        child: CharacterListItem(character: _character),
      ),
      textDirection: TextDirection.ltr,
    );
    await mockNetworkImagesFor(() async => await tester.pumpWidget(_charactersListItem));

    final tileFinder = find.byKey(Key('characterListTile'));
    expect(tileFinder, findsOneWidget);
    final titleFinder = find.text(_character.name.toUpperCase());
    final subtitleFinder = find.text('Status: ${_character.status}');
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
  });
}
