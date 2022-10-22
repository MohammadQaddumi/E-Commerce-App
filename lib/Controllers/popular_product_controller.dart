import 'package:flutter_application_1/Data/repository/workout_repo.dart';
import 'package:flutter_application_1/Models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  get images => null;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProductList=[];
      print("Success");
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      update();
      _isLoaded = true;
    }
    else{

    }
  }
}