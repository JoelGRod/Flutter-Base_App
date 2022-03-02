import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.red,
    );
  }
}