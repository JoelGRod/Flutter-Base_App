import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:movies_app/movies/widgets/widgets.dart';
import 'package:movies_app/movies/services/movies_service.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesService = Provider.of<MoviesService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper( 
              movies: moviesService.nowPlayingMovies 
            ),
            MovieSlider( 
              title: "Popular",
              movies: moviesService.popularMovies 
            )
          ],
        ),
      ),
    );
  }
}