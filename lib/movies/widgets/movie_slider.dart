import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int idx) => const _MoviePoster()
            ),
          )

        ],

      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key: key);

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
              child: const FadeInImage(
                width: 130,
                height: 190,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/imgs/no-image.jpg'), 
                image: AssetImage('assets/imgs/no-image.jpg'),
                // image: NetworkImage('https://via.placeholder.com/300x400')
              ),
            ),
          ),
          const Text(
            'Memento',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}