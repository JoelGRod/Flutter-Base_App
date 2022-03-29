import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:movies_app/movies/helpers/helpers.dart';
import 'package:movies_app/movies/models/models.dart';
import 'package:movies_app/movies/models/search_movie_resp_model.dart';
import 'package:movies_app/shared/secrets/secrets.dart';

class MoviesService extends ChangeNotifier {
  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> moviesCast = {};
  int _popularPage = 0;

  /* ------------- Streams ------------- */
  final Debouncer<String> debouncer = Debouncer(duration: const Duration(milliseconds: 500));
  final StreamController<List<Movie>> _suggestionsStreamController = StreamController.broadcast();
  
  Stream<List<Movie>> get suggestionsStream => _suggestionsStreamController.stream;
  /* ------------- End Streams ------------- */

  MoviesService() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  // Separate this to gral shared/providers
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final Uri url = Uri.https(MoviesSecrets.baseUrl, endpoint, {
      'api_key': MoviesSecrets.apiKey,
      'language': MoviesSecrets.lang,
      'page': '$page'
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

    final String jsonData =
        await _getJsonData('/3/movie/popular', _popularPage);
    final PopularRespModel moviesResponse = PopularRespModel.fromJson(jsonData);
    popularMovies = [...popularMovies, ...moviesResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    // Check if cast exists
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final String jsonData = await _getJsonData('/3/movie/$movieId/credits');
    final CreditsRespModel castResponse = CreditsRespModel.fromJson(jsonData);
    moviesCast[castResponse.id] = castResponse.cast;
    return castResponse.cast;
  }

  // This must be a Stream
  Future<List<Movie>> searchMovies(String query) async {
    final Uri url = Uri.https(MoviesSecrets.baseUrl, '/3/search/movie', {
      'api_key': MoviesSecrets.apiKey,
      'language': MoviesSecrets.lang,
      'query': query
    });

    final response = await http.get(url);
    final SearchMovieRespModel searchResponse =
        SearchMovieRespModel.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String query) {
    debouncer.value = query;
    debouncer.onValue = ( value ) async {
      final results = await searchMovies(value);
      _suggestionsStreamController.add(results);
    };

    // Not necessary
    // final timer = Timer.periodic(const Duration(milliseconds: 300), (timer) { 
    //   debouncer.value = query;
    // });

    // Future.delayed(const Duration(milliseconds: 301)).then( (value) => timer.cancel());
  }
}
