import 'dart:convert';

import 'package:movies_app/movies/models/models.dart';

class PopularRespModel {
    PopularRespModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory PopularRespModel.fromJson(String str) => PopularRespModel.fromMap(json.decode(str));

    factory PopularRespModel.fromMap(Map<String, dynamic> json) => PopularRespModel(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}

