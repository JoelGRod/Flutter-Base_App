import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
    required this.containerHeight
  }) : super(key: key);

  final double containerHeight;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: double.infinity,
        height: containerHeight,
        child: const Center(
          child: CircularProgressIndicator()
        ),
      );
  }
}