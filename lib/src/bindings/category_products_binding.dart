import 'package:get/get.dart';
import 'package:flutterfoo/src/controllers/category_products_controller.dart';

class CategoryProductsBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments;
    final categoryName = args is String
        ? args
        : (args is Map && args['category'] is String)
        ? args['category'] as String
        : '';
    Get.lazyPut<CategoryProductsController>(
      () => CategoryProductsController(categoryName: categoryName),
      tag: categoryName,
    );
  }
}
