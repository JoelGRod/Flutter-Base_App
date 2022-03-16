import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:movies_app/movies/models/models.dart';
import 'package:movies_app/shared/secrets/secrets.dart';

class MoviesService extends ChangeNotifier {
  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesService() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    Uri url = Uri.https(MoviesSecrets.baseUrl, endpoint, {
      'api_key': MoviesSecrets.apiKey,
      'language': MoviesSecrets.lang,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  getNowPlayingMovies() async {
    final String jsonData = await _getJsonData('/3/movie/now_playing');
    final NowPlayingRespModel moviesResponse =
        NowPlayingRespModel.fromJson(jsonData);
    nowPlayingMovies = moviesResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final String jsonData = await _getJsonData('/3/movie/popular', _popularPage);
    final PopularRespModel moviesResponse = PopularRespModel.fromJson(jsonData);
    popularMovies = [...popularMovies, ...moviesResponse.results];
    notifyListeners();
  }
}
