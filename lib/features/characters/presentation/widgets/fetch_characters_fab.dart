import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/characters/domain/bloc/characters_bloc.dart';

class FetchCharactersFAB extends StatelessWidget {
  const FetchCharactersFAB({
    Key key,
    @required this.charactersBloc,
  }) : super(key: key);

  final CharactersBloc charactersBloc;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        charactersBloc.add(CharactersFetch());
      },
      tooltip: 'Fetch Data',
      child: Icon(Icons.file_download),
    );
  }
}
