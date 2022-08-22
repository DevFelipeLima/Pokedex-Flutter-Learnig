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
    required this.controller,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AboutWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          AboutPkmWidget(
            pokemon: pokemon,
            list: list,
            controller: controller,
          )
        ],
      ),
    );
  }
}
