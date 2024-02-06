import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokemon/model/pokemon_user.dart';

class ApiService {
  static Future<PokemonUser?> fetchUserList(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PokemonUser.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user list');
    }
  }
}
