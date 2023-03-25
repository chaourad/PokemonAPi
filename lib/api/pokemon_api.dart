import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/model/pokemon.dart';

class PokemonApi {
  Future<List<Pokemon>> getPokemon() async {
    List<Pokemon> pokemonList = [];
    var response = await http
        .get(Uri.parse('https://pokebuildapi.fr/api/v1/pokemon/limit/100'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var i in json) {
        pokemonList.add(Pokemon.toJson(i));
      }
    }

    return pokemonList;
  }
}
