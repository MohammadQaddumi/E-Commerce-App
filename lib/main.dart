import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/popular_product_controller.dart';
import 'package:flutter_application_1/Pages/Home/home.dart';
import 'package:flutter_application_1/Pages/Splash/splash_page.dart';
import 'package:flutter_application_1/Pages/Workout/recommended_workout_details.dart';
import 'package:flutter_application_1/Pages/Workout/workout_details.dart';
import 'package:flutter_application_1/Routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Helper/dependencies.dart' as dep;
import 'Pages/Home/home_scroll.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        initialRoute: RouteHelper.getSplash(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
