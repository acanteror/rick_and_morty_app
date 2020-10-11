// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Rick & Morty App', () {
    final charactersPageInitialMessage = find.byValueKey('initialMessageText');
    final charactersPageFAB = find.byValueKey('charactersPageFAB');
    final firstCharacterName = find.text('RICK SANCHEZ');
    final firstCharacterTile = find.ancestor(of: firstCharacterName, matching: find.byValueKey('tappableListTile'));
    final characterDetailPageBodyText = find.text('CHARACTER DETAIL');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts with initial message', () async {
      expect(
        await driver.getText(charactersPageInitialMessage),
        'Pulse para cargar personajes.',
      );
    });

    test('after tapping item list navigete to detail page', () async {
      await driver.tap(charactersPageFAB);

      expect(
        await driver.getText(firstCharacterName),
        'RICK SANCHEZ',
      );
    });

    test('after tapping fab load characters', () async {
      await driver.tap(firstCharacterTile);

      expect(
        await driver.getText(characterDetailPageBodyText),
        'CHARACTER DETAIL',
      );
    });
  });
}
