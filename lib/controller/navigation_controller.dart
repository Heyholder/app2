import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
