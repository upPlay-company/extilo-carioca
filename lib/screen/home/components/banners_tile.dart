import 'package:carousel_slider/carousel_slider.dart';
import 'package:extilo_carioca/model/home/section_banners.dart';
import 'package:flutter/material.dart';

class BannersTile extends StatelessWidget {

  BannersTile(this.banners);

  final SectionBanners banners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CarouselSlider.builder(
        itemCount: banners.img.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (_, index, __){
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(banners.img[index]),
                  fit: BoxFit.cover,
                )
            ),
          );
        },
      ),
    );
  }}
