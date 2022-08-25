import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/widgets/aboutListItems.dart';
import 'package:pokedex/common/models/pokemon.dart';

class AboutPkmWidget extends StatelessWidget {
  const AboutPkmWidget(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.controller,
      required this.onChangePkm})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePkm;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(pokemon.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ))),
                      Text(pokemon.num,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ))
                    ])),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: 280,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) => onChangePkm(list[index]),
                  controller: controller,
                  children: list.map(
                      //animação da tela no switch dos itens da lista
                      (e) {
                    bool dif = e.name != pokemon.name;
                    return ItemOfAboutPage(
                      pokemon: e,
                      isDif: dif,
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
