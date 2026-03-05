import 'dart:math';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutterfoo/src/constants/home_screen_constants.dart';

class HomeScreenController extends GetxController {
  final isLoading = false.obs;
  final error = Rx<String?>(null);
  final categoryList = <String>[].obs;
  late List<int> randomIndexes;
  late List<int> randomIndexes2;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  @override
  void onInit() {
    super.onInit();
    _fetchCategoriesAndInitialize();
  }

  void _initializeIndexes() {
    randomIndexes = List.generate(categoryList.length, (i) => i)
      ..shuffle(Random());

    randomIndexes2 = List<int>.from(randomIndexes)..shuffle(Random());
  }

  Future<void> _fetchCategoriesAndInitialize() async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await _dio.get('products/category-list');
      if (response.statusCode == 200) {
        final categories = (response.data as List?)?.cast<String>() ?? [];
        categoryList.assignAll(categories);

        // Initialize random indexes after getting categories
        if (categoryList.isNotEmpty) {
          _initializeIndexes();
        }
      } else {
        error.value = 'Failed to load categories: ${response.statusCode}';
      }
    } on DioException catch (e) {
      error.value = 'Error: ${e.message}';
    } catch (e) {
      error.value = 'Unexpected error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  String getCategoryImageUrl(String categoryName) {
    // Try to find exact match in static map
    if (HomeScreenConstants.categoryImageMap.containsKey(categoryName)) {
      return HomeScreenConstants.categoryImageMap[categoryName]!;
    }

    // Try converting category name to kebab-case and find match
    final kebabCase = categoryName.toLowerCase().replaceAll(' ', '-');
    if (HomeScreenConstants.categoryImageMap.containsKey(kebabCase)) {
      return HomeScreenConstants.categoryImageMap[kebabCase]!;
    }

    // Fallback: return first available image or a placeholder
    if (HomeScreenConstants.categoryImageMap.isNotEmpty) {
      return HomeScreenConstants.categoryImageMap.values.first;
    }

    return 'assets/category-list/beauty.jpg'; // Default fallback
  }

  @override
  void onClose() {
    _dio.close();
    super.onClose();
  }
}
