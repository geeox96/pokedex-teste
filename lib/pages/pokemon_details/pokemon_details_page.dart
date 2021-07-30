import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/widgets/splash_loading.dart';

class PokemonDetailsPage extends StatefulWidget {
  @override
  _PokemonDetailsPage createState() => _PokemonDetailsPage();
}

class _PokemonDetailsPage extends State<PokemonDetailsPage> {
  bool isLoading = false;

  Future fetchDetails(url) async {
    isLoading = true;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response);
      // var pokemons = json.decode(response.body)['results'];
      // setState(() {
      // });
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    var url = ModalRoute.of(context)!.settings.arguments as String;
    fetchDetails(url);
    return isLoading? SplashLoading() :  Scaffold(
      appBar: AppBar(
        //title: Text(arguments!["name"].toString())
      ),
      body: Center(child: Text('Olá')),
    );
  }
}