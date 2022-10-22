import 'package:flutter_application_1/Controllers/popular_product_controller.dart';
import 'package:flutter_application_1/Data/API/api_client.dart';
import 'package:flutter_application_1/Data/repository/workout_repo.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> init()async {
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}