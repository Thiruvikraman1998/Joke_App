import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Joke {
  String? type;
  String? setup;
  String? punchline;
  Joke({this.type, this.setup, this.punchline});

  Joke.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    setup = json["setup"];
    punchline = json["punchline"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jokes = Map<String, dynamic>();
    jokes["type"] = this.type;
    jokes["setup"] = this.setup;
    jokes["punchline"] = this.punchline;
    return jokes;
  }
}

String jokeUrl = "https://official-joke-api.appspot.com/random_joke";
Future<Joke> fetchJoke() async {
  final response = await http.get(Uri.parse(jokeUrl));
  if (response.statusCode == 200) {
    return Joke.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
