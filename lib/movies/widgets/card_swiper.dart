import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:movies_app/movies/models/models.dart';
import 'package:movies_app/shared/widgets/widgets.dart';


class CardSwiper extends StatelessWidget {
  
  const CardSwiper({
    Key? key,
    required this.movies
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    if( movies.isEmpty ) {
      return CustomProgressIndicator(containerHeight: size.height * 0.5);
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int idx) {

          final Movie movie = movies[idx];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context, 
              'movie_details', 
              arguments: movie
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/imgs/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterUrl),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}


