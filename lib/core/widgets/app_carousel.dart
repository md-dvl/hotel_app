import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.photos});

  final List<String> photos;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var photoIndex = 0;

  Color chooseDotColor(int index) {
    switch (index) {
      case 0:
        return Colors.black.withOpacity(0.35);
      case 1:
        return Colors.black.withOpacity(0.22);
      case 2:
        return Colors.black.withOpacity(0.17);
      case 3:
        return Colors.black.withOpacity(0.10);
      case 4:
        return Colors.black.withOpacity(0.05);
      default:
        return Colors.black.withOpacity(0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 257,
            viewportFraction: 1,
            onPageChanged: (index, reason) => setState(() {
              photoIndex = index;
            }),
          ),
          itemCount: widget.photos.length,
          itemBuilder: (context, index, realIndex) => SizedBox(
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: widget.photos[index],
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Center(
                child: Text(
                  'No image found',
                  style: AppTextStyles.sfPro18w500,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: Container(
            height: 17,
            width: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.photos.length; i++)
                  Container(
                    height: 7,
                    width: 7,
                    margin: i == (widget.photos.length - 1)
                        ? null
                        : const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: photoIndex == i ? Colors.black : chooseDotColor(i),
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
