import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
      width: double.infinity,
      height: 180,
      // color: Colors.green,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int idx) => const _CastCard()
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

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
            child: const FadeInImage(
              placeholder: AssetImage("assets/imgs/no-image.jpg"), 
              image: AssetImage("assets/imgs/no-image.jpg"),
              width: 110,
              height: 140,
              fit: BoxFit.cover
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "actor.name example example example",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}