import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/popular_product_controller.dart';
import 'package:flutter_application_1/Models/products_model.dart';
import 'package:flutter_application_1/Routes/route_helper.dart';
import 'package:flutter_application_1/Widgets/app_column.dart';
import 'package:flutter_application_1/Widgets/big_text.dart';
import 'package:flutter_application_1/Widgets/icon_and_text_widget.dart';
import 'package:flutter_application_1/Widgets/small_text.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:get/get.dart';

class HomeScroll extends StatefulWidget {
  const HomeScroll({super.key});

  @override
  State<HomeScroll> createState() => _HomeScrollState();
}

class _HomeScrollState extends State<HomeScroll> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount:
                    (popularProduct.popularProductList.length / 6).toInt(),
                itemBuilder: (context, position) {
                  return popularProduct.isLoaded
                      ? _buildPageItem(
                          position, popularProduct.popularProductList[position])
                      : CircularProgressIndicator(
                          color: AppColors.mainColor,
                        );
                }),
          );
        }),
        //Dots
        // ignore: unnecessary_new
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : (popularProduct.popularProductList.length / 6).toInt(),
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //Popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width30, bottom: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(left: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(left: 2),
                child: SmallText(text: "Workouts"),
              )
            ],
          ),
        ),
        //workout list
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularProduct.popularProductList.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedWorkoutDetails());
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: Dimensions.width20,
                        left: Dimensions.width20,
                        bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        //image
                        Container(
                          width: Dimensions.ListViewImgSize,
                          height: Dimensions.ListViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white24,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://dummyjson.com/image/i/products/9/2.png")),
                          ),
                        ),
                        //text
                        Expanded(
                          child: Container(
                            height: Dimensions.ListViewTextContSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20)),
                                color: Colors.white24),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Abs Workout by John Hamada"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  SmallText(text: "for losing weigh"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: Colors.amber,
                                      ),
                                      const IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: Colors.blue,
                                      ),
                                      const IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "32min",
                                        iconColor: Colors.blue,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }));
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getWorkoutDetails(index));
            },
            child: Container(
                height: Dimensions.pageViewContainer,
                margin:
                    const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: DecorationImage(
                        image: NetworkImage(popularProduct.thumbnail!),
                        fit: BoxFit.cover))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer * 1.2,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    const BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    const BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: AppColumn(text: popularProduct.title!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
