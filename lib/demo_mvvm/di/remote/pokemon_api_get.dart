import 'dart:convert';
import 'package:flutterappexample/demo_mvvm/di/remote/pokemon_api.dart';
import 'package:flutterappexample/demo_mvvm/model/Pokemon.dart';
import 'package:http/http.dart';
class PokemonApiGet implements PokemonApi{
  @override
  Future<List<Pokemon>> getPokemonList() async {
    try{
      final response = await get('http://pokeapi.salestock.net/api/v2/pokemon/');
      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = json.decode(response.body);
        var list = mapResponse['results'] as List;
        List<Pokemon> listPokemon = List();
        for (var idx=0;idx<list.length;idx++) {
          Pokemon pokemon = Pokemon();
          pokemon.name = list.asMap()[idx]['name'];
          listPokemon.add(pokemon);
        }
        return listPokemon;
      }else{
        throw Exception("Error Code: ${response.statusCode}");
      }
    }catch(e){
      throw Exception("There was a problem with the connection");
    }
  }
}