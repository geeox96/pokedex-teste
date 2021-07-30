import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import "string_extension.dart";

class PokemonCard extends StatelessWidget {
  PokemonCard(this.name, this.id);

  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Container(height: 15),
        Text(
          name.capitalize(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://pokeres.bastionbot.org/images/pokemon/$id.png')
                      )),
        )
      ],
    ));
  }
}
