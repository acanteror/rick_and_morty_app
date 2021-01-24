import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_list.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/fetch_characters_fab.dart';

class CharactersPage extends StatelessWidget {
  CharactersPage({Key key, charactersBloc})
      : charactersBloc = charactersBloc ?? Get.find<CharactersBloc>(),
        super(key: key);

  final CharactersBloc charactersBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('charactersPageAppBar'),
        title: Text('Characters'),
      ),
      body: CharactersList(
        key: Key('charactersPageBody'),
        charactersBloc: charactersBloc,
      ),
      floatingActionButton: FetchCharactersFAB(
        key: Key('charactersPageFAB'),
        charactersBloc: charactersBloc,
      ),
    );
  }
}
