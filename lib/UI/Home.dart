import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: Container(
        width: 1440.w,
        height: 7819.h,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                width: 1448.w,
                height: 1006.h,color: Colors.blue
                // child: Image.asset(
                //   'assets/b.png',
                //   fit: BoxFit.fill,
                // ),
              ),
              options: CarouselOptions(
                height: 500.h,
                aspectRatio: 16 / 16,
                viewportFraction: 0.8,
                initialPage: currentIndex,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                onPageChanged: (index, c) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                autoPlayInterval: Duration(seconds: 1),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: 5,
              effect: WormEffect(),
            )
          ],
        ),
      ),
    );
  }
}
