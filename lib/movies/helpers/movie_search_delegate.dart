import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies_app/movies/models/models.dart';

import 'package:movies_app/movies/services/movies_service.dart';

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
      return _emptyWidget();
    }

    final moviesService = Provider.of<MoviesService>(context, listen: false);

    return FutureBuilder(
        future: moviesService.searchMovies(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) {
            return _emptyWidget();
          }

          final List<Movie> movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int idx) =>
                _MovieItem(movie: movies[idx]),
          );
        });
  }

  Widget _emptyWidget() {
    return const Center(
        child:
            Icon(Icons.movie_creation_sharp, color: Colors.black38, size: 150));
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage("assets/imgs/no-image.jpg"),
          image: NetworkImage(movie.fullPosterUrl),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () => Navigator.pushNamed(
        context, 
        'movie_details', 
        arguments: movie
      ),
    );
  }
}
