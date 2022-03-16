import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:movies_app/movies/models/models.dart';
import 'package:movies_app/shared/secrets/secrets.dart';

class MoviesService extends ChangeNotifier {

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  MoviesService() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  getNowPlayingMovies() async {
    Uri url = Uri.https(MoviesSecrets.baseUrl, '/3/movie/now_playing', {
      'api_key': MoviesSecrets.apiKey,
      'language': MoviesSecrets.lang,
      'page': '1',
    });

    final response = await http.get(url);
    final NowPlayingRespModel moviesResponse =
        NowPlayingRespModel.fromJson(response.body);
    nowPlayingMovies = moviesResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    Uri url = Uri.https(MoviesSecrets.baseUrl, '/3/movie/popular', {
      'api_key': MoviesSecrets.apiKey,
      'language': MoviesSecrets.lang,
      'page': '1',
    });

    final response = await http.get(url);
    final PopularRespModel moviesResponse =
        PopularRespModel.fromJson(response.body);
    popularMovies = [...popularMovies, ...moviesResponse.results];
    notifyListeners();
  }
}
