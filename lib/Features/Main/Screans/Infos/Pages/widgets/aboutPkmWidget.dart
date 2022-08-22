import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class AboutPkmWidget extends StatelessWidget {
  const AboutPkmWidget(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.controller})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      height: 400,
      left: 0,
      right: 0,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    pokemon.num,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: PageView(
                  controller: controller,
                  children: list
                      .map(
                        (e) => Image.network(
                          e.image,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
