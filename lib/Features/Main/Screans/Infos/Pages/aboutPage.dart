import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/widgets/aboutPkmWidget.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/widgets/aboutWidget.dart';
import 'package:pokedex/common/models/pokemon.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AboutWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          AboutPkmWidget(pokemon: pokemon)
        ],
      ),
    );
  }
}
