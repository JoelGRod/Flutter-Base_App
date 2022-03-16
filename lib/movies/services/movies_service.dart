import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:movies_app/movies/models/models.dart';


class MoviesService extends ChangeNotifier {

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '5c049880e11525b023c95249d3047b17';
  final String _lang = 'es-ES';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  MoviesService() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  getNowPlayingMovies() async {
    Uri url = Uri.https(                                                                                                                                       
      _baseUrl, 
      '/3/movie/now_playing', 
      {
        'api_key': _apiKey,
        'language': _lang,
        'page': '1',
      }
    );

    final response = await http.get(url);
    final NowPlayingRespModel moviesResponse = NowPlayingRespModel.fromJson(response.body);
    nowPlayingMovies = moviesResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    Uri url = Uri.https(                                                                                                                                       
      _baseUrl, 
      '/3/movie/popular', 
      {
        'api_key': _apiKey,
        'language': _lang,
        'page': '1',
      }
    );

    final response = await http.get(url);
    final PopularRespModel moviesResponse = PopularRespModel.fromJson(response.body);
    popularMovies = [ ...popularMovies, ...moviesResponse.results ];
    notifyListeners();
  }


}