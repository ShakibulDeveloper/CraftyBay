import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsCarousel extends StatefulWidget {
  final double? height;
  final List<String> urls;
  const ProductDetailsCarousel({
    super.key,
    this.height,
    required this.urls,
  });

  @override
  State<ProductDetailsCarousel> createState() => _ProductDetailsCarouselState();
}

class _ProductDetailsCarouselState extends State<ProductDetailsCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 200.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            autoPlay: false,
            viewportFraction: 1,
          ),
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(image: NetworkImage(url))),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 4),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.urls.length; i++)
                    Container(
                      height: 13,
                      width: 13,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: i == _currentIndex.value
                            ? AppColors.primaryColor
                            : Colors.white,
                        border: Border.all(
                          color: i == _currentIndex.value
                              ? AppColors.primaryColor
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
