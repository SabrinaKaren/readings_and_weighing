import 'dart:math';
import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/shared/utils/common_methods.dart';

class HomeBackgroundPageState extends StatelessWidget {

  final List<Widget> mainContentList;
  HomeBackgroundPageState({Key? key, required this.mainContentList}) : super(key: key);
  
  final CommonMethods _commonMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenOrientation = MediaQuery.of(context).orientation;

    Row _landscapeOrientation = Row(
      children: [
        Container(
          color: Colors.red,
          width: screenWidth/2,
          child: this.mainContentList[0],
        ),
        Container(
          color: Colors.indigo,
          width: screenWidth/2,
          child: this.mainContentList[1],
        ),
      ],
    );

    Stack _portraitOrientation = Stack(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              this.mainContentList[0],
              this.mainContentList[1],
            ],
          ),
        ),
      ],
    );

    return Visibility(
      visible: _commonMethods.isTheOrientationLandscape(screenOrientation),
      child: _landscapeOrientation,
      replacement: _portraitOrientation,
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