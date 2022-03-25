import 'dart:convert';

import 'package:movies_app/movies/models/models.dart';

class SearchMovieRespModel {
    SearchMovieRespModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory SearchMovieRespModel.fromJson(String str) => SearchMovieRespModel.fromMap(json.decode(str));

    factory SearchMovieRespModel.fromMap(Map<String, dynamic> json) => SearchMovieRespModel(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}

