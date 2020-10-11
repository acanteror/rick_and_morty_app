import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  CharacterDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('characterDetailPageAppBar'),
        title: Text('Character Detail'),
      ),
      body: Center(
        key: Key('characterDetailPageBody'),
        child: Text('CHARACTER DETAIL'),
      ),
    );
  }
}
