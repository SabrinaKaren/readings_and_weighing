import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GestureMenuItemWidget extends StatelessWidget {

  final String title;
  final String image;
  final Color imageColor;
  final Function onTap;

  const GestureMenuItemWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    this.imageColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Column(
        children: [
          Image.asset(this.image, width: screenWidth * 0.3, color: this.imageColor),
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