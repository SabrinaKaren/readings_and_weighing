import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readings_and_weighing/app/shared/utils/common_methods.dart';

class GestureMenuItemWidget extends StatelessWidget {

  final String title;
  final String image;
  final Color imageColor;
  final Function onTap;

  GestureMenuItemWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    this.imageColor = Colors.black,
  }) : super(key: key);

  final CommonMethods _commonMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenOrientation = MediaQuery.of(context).orientation;

    return GestureDetector(
      child: Column(
        children: [
          Image.asset(
            this.image,
            width: _commonMethods.isTheOrientationLandscape(screenOrientation)
                ? screenHeight * 0.3
                : screenWidth * 0.3,
            color: this.imageColor,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              this.title,
              style: GoogleFonts.aBeeZee(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: this.imageColor,
              ),
            ),
          ),
        ],
      ),
      onTap: () => this.onTap(),
    );

  }

}