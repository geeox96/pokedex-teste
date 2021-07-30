import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/home_page.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/pages/pokemon_details/pokemon_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.amareloPikachu,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => PokemonDetailsPage(),
      },
    );
  }
}
