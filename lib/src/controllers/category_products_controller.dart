import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutterfoo/src/models/product_model.dart';

class CategoryProductsController extends GetxController {
  final String categoryName;

  CategoryProductsController({required this.categoryName});

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final RxBool isLoading = false.obs;
  final RxString error = RxString('');
  final RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    error.value = '';

    try {
      final response = await _dio.get('/products/category/$categoryName');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final productsList =
            (data['products'] as List<dynamic>?)
                ?.map((json) => Product.fromJson(json as Map<String, dynamic>))
                .toList() ??
            [];

        products.assignAll(productsList);
      } else {
        error.value = 'Failed to load products: ${response.statusCode}';
      }
    } on DioException catch (e) {
      error.value = 'Error: ${e.message}';
    } catch (e) {
      error.value = 'Unexpected error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
