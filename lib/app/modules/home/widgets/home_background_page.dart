import 'dart:math';
import 'package:flutter/material.dart';

class HomeBackgroundPageState extends StatelessWidget {

  final Widget mainContent;
  const HomeBackgroundPageState({Key? key, required this.mainContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(color: Colors.red),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: FunctionClipper(),
            child: Container(color: Colors.indigo),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: this.mainContent,
        ),
      ],
    );

  }

}

class FunctionClipper extends CustomClipper<Path> {

  Path getClip(Size size) {

    final path = Path();
    path.moveTo(0, _splitFunction(size, 0));

    for (double x = 1; x <= size.width; x++) {
      path.lineTo(x, _splitFunction(size, x));
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
    
  }

  _splitFunction (Size size, double x) {
    final normalizedX = x / size.width * 2 * pi;
    final waveHeight = size.height / 15;
    final y = size.height / 2 - sin(normalizedX) * waveHeight;
    return y;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}