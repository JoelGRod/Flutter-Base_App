import 'package:flutter/material.dart';

import 'package:movies_app/movies/models/models.dart';
import 'package:movies_app/shared/widgets/widgets.dart';


class MovieSlider extends StatelessWidget {
  const MovieSlider({
    Key? key,
    required this.movies
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    if( movies.isEmpty ) {
      return CustomProgressIndicator(containerHeight: size.height * 0.3);
    }
    
    return SizedBox(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Popular', 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int idx) {
                final Movie movie = movies[idx];
                return _MoviePoster(movie: movie);
              }
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
    required this.movie
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      // color: Colors.indigo,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context, 
              'movie_details',
              arguments: 'movie-instance'
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                width: 130,
                height: 190,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/imgs/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterUrl),
              ),
            ),
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}