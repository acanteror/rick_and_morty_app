import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/characters_list.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/fetch_characters_fab.dart';

class CharactersPage extends StatelessWidget {
  CharactersPage({
    Key key,
    charactersBloc,
  })  : charactersBloc = charactersBloc ?? Get.find<CharactersBloc>(),
        super(key: key);

  final CharactersBloc charactersBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('charactersPageAppBar'),
        title: Text('Characters'),
        actions: [
          AppBarFavouriteIconButton(),
        ],
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

class AppBarFavouriteIconButton extends StatelessWidget {
  const AppBarFavouriteIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      cubit: Get.find<CharactersBloc>(),
      builder: (context, state) {
        final bool _enableButton = state is CharactersLoaded;
        return IconButton(
          icon: Icon(
            Icons.favorite_outline_sharp,
            color: Colors.white,
          ),
          onPressed: () => _enableButton
              ? Get.find<CharactersBloc>().add(
                  CharactersFilter(),
                )
              : null,
        );
      },
    );
  }
}
