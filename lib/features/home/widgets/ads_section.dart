import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdsSection extends StatelessWidget {
  const AdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // sample ad images
    final List<String> adImages = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW39Wt5vPlwFhvXsX624R2-qw7IGkuY6R5LA&s',
      'https://img.freepik.com/free-psd/banner-template-black-friday-clearance_23-2148745448.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRudBQ0WGIRS3qXS_lNx7NMgXQl0ogilmjdFA&s',
    ];

    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: CarouselSlider.builder(
            itemCount: adImages.length, 
            itemBuilder: (context, index, realIndex){
              return Container(
                margin: const EdgeInsets.only(right: 2, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    adImages[index],
                    fit: BoxFit.cover,
                    errorBuilder:(context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              );
            }, 
            options: CarouselOptions(
              height: 200,
              viewportFraction: 0.95,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              padEnds: true,
            ),
            ),
        ),
      ],
    );
  }
}