import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/model/pokemon_model.dart';

class ApiService {
  static Future<PokemonList?> fetchUserList(int pagekey, int pageSize) async {
    final response = await http.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon/?offset=$pageSize&limit=$pagekey'));

    if (response.statusCode == 200) {
      return PokemonList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user list');
    }
  }
}
