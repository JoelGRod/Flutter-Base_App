import 'package:flutter/material.dart';

import 'package:movies_app/movies/widgets/widgets.dart';
import 'package:movies_app/movies/models/models.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _MoviePosterAndTitle(movie: movie),
              _MovieOverview(movie: movie),
              CastingCards(movieId: movie.id)

            ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // backgroundColor: AppTheme.primaryColor,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          )
        ),
        centerTitle: true,
        background: FadeInImage(
          placeholder: const AssetImage('assets/imgs/loading.gif'), 
          image: NetworkImage(movie.fullBackdrop),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _MoviePosterAndTitle extends StatelessWidget {
  const _MoviePosterAndTitle({ 
    Key? key,
    required this.movie
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.red,
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage("assets/imgs/no-image.jpg"), 
                image: NetworkImage(movie.fullPosterUrl),
                height: (size.width / 2.5),
              ),
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width / 2 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title, 
                  style: textTheme.headline5, 
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 2
                ),
                Text(
                  movie.originalTitle, 
                  style: textTheme.subtitle1, 
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 2
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_outlined, 
                      size: 15, 
                      color: Colors.grey,),
                    const SizedBox(width: 5),
                    Text('${movie.voteAverage}', style: textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MovieOverview extends StatelessWidget {
  const _MovieOverview({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      // color: Colors.red,
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1
      ),
    );
  }
}