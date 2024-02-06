import 'dart:convert';

import 'package:flutter/material.dart';

class PokemonList {
  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  PokemonList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonList.fromRawJson(String str) =>
      PokemonList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? name;
  String? url;
  String? imageUrl;

  Result({
    this.name,
    this.url,
    this.imageUrl,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
        imageUrl:
            'https://img.pokemondb.net/sprites/sword-shield/icon/${json['name']}.png',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
