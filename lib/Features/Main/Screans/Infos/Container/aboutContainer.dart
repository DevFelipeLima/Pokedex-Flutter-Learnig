import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/aboutPage.dart';
import 'package:pokedex/common/widgest/errorPatern.dart';
import 'package:pokedex/common/widgest/loandingPatern.dart';

import '../../../../../common/errors/failontry.dart';
import '../../../../../common/models/pokemon.dart';
import '../../../../../common/repositories/pkm_repository.dart';

class ArgumentsInfo {
  ArgumentsInfo({required this.pokemon});
  final Pokemon pokemon;
}

class AboutContainer extends StatefulWidget {
  const AboutContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final IPkmRepository repository;
  final ArgumentsInfo arguments;
  final VoidCallback onBack;

  @override
  State<AboutContainer> createState() => _AboutContainerState();
}

class _AboutContainerState extends State<AboutContainer> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.6,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: widget.repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoandingPatern();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return AboutPage(
            pokemon: widget.arguments.pokemon,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: controller,
          );
        } else if (snapshot.hasError) {
          return ErrorPatern(
            error: (snapshot.error as FailOnTry).message!,
          );
        }
        return Container();
      },
    );
  }
}
