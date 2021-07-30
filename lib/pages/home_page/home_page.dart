import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/widgets/pokemon_card.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pages/home_page/widgets/splash_loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool isLoading = false;
  List allPokemons = [];

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

  Future fetchPokemons() async {
    isLoading = true;
    final String url = 'https://pokeapi.co/api/v2/pokemon?limit=151';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var pokemons = json.decode(response.body)['results'];
      setState(() {
        allPokemons = pokemons;
      });
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // do something
              },
            )
          ],
          title: Text('Pokedex Arctica'),
        ),
        body: isLoading
            ? SplashLoading()
            : GridView.builder(
                itemCount: allPokemons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/details',
                                arguments: allPokemons[index]['url']);
                          },
                          child: PokemonCard(
                              allPokemons[index]['name'], index + 1)));
                }));
  }
}
