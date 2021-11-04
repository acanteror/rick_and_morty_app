import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/favourites/domain/bloc/favourites_bloc.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    Key key,
    this.id,
  }) : super(key: key);

  final String id;

  @override
  _FavouriteIconButtonState createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  @override
  void initState() {
    Get.find<FavouritesBloc>().add(FavouritesFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      cubit: Get.find<FavouritesBloc>(),
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        final bool _isFavourite = state is! FavouritesSuccess
            ? false
            : (state as FavouritesSuccess).favourites.contains(widget.id);
        return IconButton(
          icon: _isFavourite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
          onPressed: () {
            Get.find<FavouritesBloc>().add(
              FavouritesToggle(id: widget.id),
            );
            setState(() {});
          },
        );
      },
    );
  }
}
