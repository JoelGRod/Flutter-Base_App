import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '5c049880e11525b023c95249d3047b17';
  final String _lang = 'es-ES';

  MoviesProvider() {
    getNowPlayingMovies();
  }

  getNowPlayingMovies() async {
    var url = Uri.https(
      _baseUrl, 
      '/3/movie/now_playing', 
      {
        'api_key': _apiKey,
        'language': _lang,
        'page': '1',
      }
    );

    final response = await http.get(url);

    final Map<String, dynamic> decoded = json.decode(response.body);

    print(decoded['results']);
  }
}