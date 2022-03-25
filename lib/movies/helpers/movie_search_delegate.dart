import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Search Movie";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Build results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return const Center(
          child: Icon(
            Icons.movie_creation_sharp,
            color: Colors.black38, 
            size: 150
          )
      );
    }

    // TODO: Future Builder using Search Movies (see casting cards):
    return const Center();
  }
}
