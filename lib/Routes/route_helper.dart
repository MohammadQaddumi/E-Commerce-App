import 'package:flutter_application_1/Pages/Home/home_page.dart';
import 'package:flutter_application_1/Pages/Splash/splash_page.dart';
import 'package:flutter_application_1/Pages/Workout/recommended_workout_details.dart';
import 'package:flutter_application_1/Pages/Workout/workout_details.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String workoutDetails = "/workout-details";
  static const String recommendedWorkoutDetails = "/recommended-workout-details";

  static String getSplash()=>'$splashPage';
  static String getInitial()=>'$initial';
  static String getWorkoutDetails(int pageId)=>'$workoutDetails?pageId=$pageId';
  static String getRecommendedWorkoutDetails()=>'$recommendedWorkoutDetails';

  static List<GetPage> routes=[
    GetPage(name: splashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),

    GetPage(name: workoutDetails, page: (){
      var pageId = Get.parameters['pageId'];
      return WorkoutDetails(pageId: int.parse(pageId!),);
    },
    transition: Transition.fadeIn
    ),
    
    GetPage(name: recommendedWorkoutDetails, page: (){
      return RecommendedWorkoutDetails();
    },
    transition: Transition.fadeIn
    ),
  ];
}