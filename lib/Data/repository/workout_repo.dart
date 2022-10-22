import 'package:flutter_application_1/Data/API/api_client.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}