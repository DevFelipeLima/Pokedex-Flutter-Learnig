import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class ItemOfAboutPage extends StatelessWidget {
  const ItemOfAboutPage({Key? key, required this.isDif, required this.pokemon})
      : super(key: key);
  final bool isDif;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
          opacity: isDif ? 0.5 : 1.0,
          duration: Duration(milliseconds: 300),
          child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 350),
            curve: Curves.easeIn,
            tween: Tween<double>(
              end: isDif ? 120 : 230,
              begin: isDif ? 230 : 120,
            ),
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: isDif ? Colors.black.withOpacity(0.4) : null,
              );
            },
          )),
    );
  }
}
