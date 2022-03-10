import 'package:flutter/material.dart';

import 'package:movies_app/movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final String movie = 
    ModalRoute.of(context)?.settings.arguments.toString() 
    ?? 'No Movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const _MoviePosterAndTitle(),
              const _MovieOverview(),
              const _MovieOverview(),
              const _MovieOverview(),
              const CastingCards()

            ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  const _CustomAppBar({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          )
        ),
        centerTitle: true,
        background: const FadeInImage(
          placeholder: AssetImage('assets/imgs/loading.gif'), 
          image: AssetImage('assets/imgs/loading.gif'),
          // image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _MoviePosterAndTitle extends StatelessWidget {
  const _MoviePosterAndTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.red,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/imgs/no-image.jpg"), 
              image: AssetImage("assets/imgs/no-image.jpg"),
              height: 200,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title', 
                style: textTheme.headline5, 
                overflow: TextOverflow.ellipsis, 
                maxLines: 2
              ),
              Text(
                'movie.originalTitle', 
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
                  Text("movie.voteAverage", style: textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _MovieOverview extends StatelessWidget {
  const _MovieOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      // color: Colors.red,
      child: Text(
        "Proident ipsum ad mollit aliquip incididunt do qui quis cillum ad id consequat ea incididunt. Qui esse sit commodo aliquip ullamco exercitation consectetur. Proident eiusmod sint aute occaecat mollit qui exercitation. Laborum dolor consectetur cupidatat sit deserunt proident laboris enim commodo qui ut ea tempor enim. Eu mollit sint anim consequat deserunt.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1
      ),
    );
  }
}