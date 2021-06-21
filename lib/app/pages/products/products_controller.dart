import 'package:get/get.dart';

class ProductsController extends GetxController {

  //region Private
  //endregion

  //region Variables

  final bottomBarCurrentIndex = 0.obs;

  final products = [
    'Product 1234555',
    'Product 1234555',
    'Product 1234555',
    'Product 1234555',
    'Product 1234555',
    'Product 1234555',
    'Product 1234555',
  ];

  void changePage(int index){
    bottomBarCurrentIndex.value = index;
  }

  //endregion

  //region Functions
  //endregion

}