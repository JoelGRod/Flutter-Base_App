import 'package:flutter/material.dart';

import 'package:movies_app/shared/themes/themes.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final String movie = 
    ModalRoute.of(context)?.settings.arguments.toString() 
    ?? 'No Movie';

    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar()
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