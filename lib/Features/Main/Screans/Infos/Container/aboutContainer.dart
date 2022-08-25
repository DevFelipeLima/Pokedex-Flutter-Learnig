import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/aboutPage.dart';
import 'package:pokedex/common/widgest/errorPatern.dart';
import 'package:pokedex/common/widgest/loandingPatern.dart';

import '../../../../../common/errors/failontry.dart';
import '../../../../../common/models/pokemon.dart';
import '../../../../../common/repositories/pkm_repository.dart';

class ArgumentsInfo {
  ArgumentsInfo({required this.pokemon, this.index = 0});
  final Pokemon pokemon;
  final int? index;
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
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.6,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.getAllPokemons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoandingPatern();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (_pokemon == null) {
            _pokemon = widget.arguments.pokemon;
          }
          return AboutPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: controller,
            onChangePkm: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
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
