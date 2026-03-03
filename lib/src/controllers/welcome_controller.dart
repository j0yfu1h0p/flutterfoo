import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final RxInt currentIndex = 0.obs;

  static const int slideCount = 3;

  void changeIndex(int index) {
    if (index >= slideCount) {
      currentIndex.value = 0;
      return;
    }

    currentIndex.value = index;
  }

  bool get isLastSlide => currentIndex.value == slideCount - 1;

  bool get isFirstSlide => currentIndex.value == 0;
}
