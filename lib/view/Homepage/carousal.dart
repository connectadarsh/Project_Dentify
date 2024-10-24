import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:flutter/material.dart';

class Carousal extends StatelessWidget {
  const Carousal({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> caroimages = [
      'asset/home1.jpg',
      'asset/home2.jpg',
      'asset/home3.jpg'
    ];
    return CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                caroimages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
            // height: 200, // Total height of the carousel
            autoPlay: true, // Enable auto-scrolling
            autoPlayInterval: const Duration(seconds: 3), // Time between slides
            enlargeCenterPage: true, // Enlarges the center slide
            viewportFraction: 1,
            aspectRatio: 1.5,
            ));
  }
}
