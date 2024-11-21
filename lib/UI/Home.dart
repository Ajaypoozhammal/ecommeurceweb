import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    width: 1448.w,
                    child: Image.asset(
                      'assets/b.png',
                      fit: BoxFit.fill,
                    ),
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
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: 5,
                    effect: WormEffect(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Container(
                        width: 6.w,
                        height: 30.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFF8A33FD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),SizedBox(width: 5.w,),
                      Text(
                        'Categories For Men',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF3C4242),
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 1000.h,
                  child: GridView.builder(physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 400 / 400,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 270.36.w,
                            height: 393.26.h,
                            child: Image.asset(
                              "assets/c.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 37, right: 37),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 128.48.w,
                                  height: 70.90.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Shirts',
                                        style: GoogleFonts.castoro(
                                          color: Color(0xFF2A2F2F),
                                          fontSize: 17.88.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Explore Now!',
                                        style: GoogleFonts.castoro(
                                          color: Color(0xFF7F7F7F),
                                          fontSize: 13.41.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF7F7F7F),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Container(
                        width: 6.w,
                        height: 30.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFF8A33FD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),SizedBox(width: 5.w,),
                      Text(
                        'Categories For Men',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF3C4242),
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
