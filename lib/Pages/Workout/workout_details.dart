import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Controllers/popular_product_controller.dart';
import 'package:flutter_application_1/Pages/Home/home.dart';
import 'package:flutter_application_1/Routes/route_helper.dart';
import 'package:flutter_application_1/Widgets/app_column.dart';
import 'package:flutter_application_1/Widgets/app_icon.dart';
import 'package:flutter_application_1/Widgets/big_text.dart';
import 'package:flutter_application_1/Widgets/app_column.dart';
import 'package:flutter_application_1/Widgets/expandable_text_widget.dart';
import 'package:flutter_application_1/Widgets/icon_and_text_widget.dart';
import 'package:flutter_application_1/Widgets/small_text.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:get/get.dart';

class WorkoutDetails extends StatelessWidget {
  int pageId;
  WorkoutDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var workout = Get.find<PopularProductController>().popularProductList[pageId];
    print("page id is" + pageId.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
            right: 0,
            left: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.WorkoutDetailsImg,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(workout.thumbnail))),
            )),
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.initial);
            },
            child: AppIcon(icon: Icons.arrow_back_ios_new)),
          AppIcon(icon: Icons.shopping_cart)
        ],)),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          top: Dimensions.WorkoutDetailsImg-20,
          child: Container(
            padding: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20, top: Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius30) ,
                topLeft: Radius.circular(Dimensions.radius30)
              ),
              color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              AppColumn(text: workout.title),
              SizedBox(height: Dimensions.height20,),
              BigText(text: "Introduction"),
              SizedBox(height: Dimensions.height20,),
              Expanded(child: SingleChildScrollView(child: ExpandableText(text: workout.description,)))
            ],)
          ))
      ]),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, right: Dimensions.width20, left: Dimensions.width20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), 
          topLeft: Radius.circular(Dimensions.radius20)),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            padding: EdgeInsets.all(Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white
            ),
            child: Row(
              children: [
                Icon(Icons.remove, color: AppColors.signColor,),
                SizedBox(width: Dimensions.width10/2,),
                BigText(text: "0"),
                SizedBox(width: Dimensions.width20/2,),
                Icon(Icons.add, color: AppColors.signColor,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: AppColors.mainColor,
            ),
            child: BigText(text: "\$10 | Add to cart", color: Colors.white,)
          )
        ],),
      ),
    );
  }
}
