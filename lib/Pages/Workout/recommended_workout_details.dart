import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Routes/route_helper.dart';
import 'package:flutter_application_1/Widgets/app_icon.dart';
import 'package:flutter_application_1/Widgets/expandable_text_widget.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../Widgets/big_text.dart';

class RecommendedWorkoutDetails extends StatelessWidget {
  const RecommendedWorkoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                child: Center(
                  child: BigText(text:"Abs workout", size: Dimensions.font26),
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top:5, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)
                    )
                  ),
              )),
            pinned: true,
            backgroundColor: Colors.blueGrey[900],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/Workout_1.jpg",
               width: double.maxFinite,
               fit: BoxFit.cover,),
              
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableText(text: "Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild  Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild Build a bigger armsBuild a bigger armsBuild"),
                )
              ],
            ),
          )
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              right: Dimensions.width20*2.5,
              left: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppIcon(
                iconSize: Dimensions.font24,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                icon: Icons.remove),
                BigText(text: "\$12.88 "" X "" 0 ", size: Dimensions.font24,color: AppColors.mainBlackColor,),
                AppIcon(
                iconSize: Dimensions.font24,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                icon: Icons.add)
            ],),
          ),
          Container(
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
            child: Icon(Icons.favorite,
            color: AppColors.mainColor,),
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
        ],
      ),
    );
  }
}