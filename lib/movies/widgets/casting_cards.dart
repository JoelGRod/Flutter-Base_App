import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies_app/shared/widgets/widgets.dart';
import 'package:movies_app/movies/models/models.dart';

import 'package:movies_app/movies/services/movies_service.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({
    Key? key,
    required this.movieId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesService = Provider.of<MoviesService>(context, listen: true);

    return FutureBuilder(
      future: moviesService.getMovieCast(movieId),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData) {
          return const SizedBox(
            height: 180,
            child: CustomProgressIndicator(containerHeight: 180)
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(top: 10, bottom: 30),
          width: double.infinity,
          height: 180,
          // color: Colors.green,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (BuildContext context, int idx) => _CastCard(castProfile: cast[idx])
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  
  final Cast castProfile;
  
  const _CastCard({
    Key? key,
    required this.castProfile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      // color: Colors.red,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage("assets/imgs/no-image.jpg"), 
              image: NetworkImage(castProfile.fullProfilePath),
              width: 110,
              height: 140,
              fit: BoxFit.cover
            ),
          ),
          const SizedBox(height: 5),
          Text(
            castProfile.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}