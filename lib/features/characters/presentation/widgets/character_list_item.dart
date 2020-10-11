import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/character_detail_page.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/result.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    Key key,
    @required Result character,
  })  : _character = character,
        super(key: key);

  final Result _character;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        key: Key('tappableListTile'),
        child: ListTile(
          key: Key('characterListTile'),
          leading: Image.network(_character.image),
          title: Text(_character.name.toUpperCase()),
          subtitle: Text('Status: ${_character.status}'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Get.to(CharacterDetailPage());
          },
        ),
      ),
    );
  }
}
