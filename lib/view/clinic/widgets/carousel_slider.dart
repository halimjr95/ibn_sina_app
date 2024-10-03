import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class BuildCarouselSlider extends StatelessWidget {
  final List<Widget> images;
  const BuildCarouselSlider({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 4.5,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 6),
        autoPlayAnimationDuration: Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        reverse: false,
      ),
    );
  }
}

