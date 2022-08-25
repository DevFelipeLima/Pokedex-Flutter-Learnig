import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key, required this.pokemon, required this.onBack})
      : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.chevron_left),
      ),
    );
  }
}
