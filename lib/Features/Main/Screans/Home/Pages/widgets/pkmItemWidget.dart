import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Home/Pages/widgets/TypePkmItemWidget.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Container/aboutContainer.dart';
import 'package:pokedex/common/models/pokemon.dart';

class PkmItem extends StatelessWidget {
  const PkmItem(
      {Key? key,
      required this.pokemon,
      required this.onTap,
      required this.index})
      : super(key: key);
  final Pokemon pokemon;
  final Function(String, ArgumentsInfo) onTap;
  final int index;
//minha opção deixar a imagem entre o tipo e o nome, e nao colocar o numero.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          onTap('/about', ArgumentsInfo(pokemon: pokemon, index: index)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pokemon.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Flexible(
                      child: Container(
                    height: 100,
                    width: 200,
                  )),
                  Column(
                    children: pokemon.type
                        .map((e) => TypePkmItem(
                              name: e,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          (Positioned(
              bottom: 10,
              right: 2,
              child: Image.network(
                pokemon.image,
                height: 120,
              )))
        ],
      ),
    );
  }
}
