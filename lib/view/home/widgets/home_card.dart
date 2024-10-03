import 'package:flutter/material.dart';
import 'package:inb_sina/core/constants.dart';

class HomeCard extends StatelessWidget {
  final String img;
  const HomeCard({Key? key, required this.img}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFF072370),
          width: 3,
        ),
      ),
      child: Image(
        image: AssetImage(img),
      ),
    );
  }
}

