
import 'package:get/get.dart';
import '../controllers/bottomappbar_controller.dart';


class BottomappbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomappbarController>(() => BottomappbarController());
  }
}