import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/widgets/aboutPkmWidget.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/widgets/aboutAppBarWidget.dart';
import 'package:pokedex/common/models/pokemon.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePkm,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePkm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          AboutWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          AboutPkmWidget(
            pokemon: pokemon,
            list: list,
            controller: controller,
            onChangePkm: onChangePkm,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    color: pokemon.baseColor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
