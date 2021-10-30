
import 'package:get/get.dart';
import '../controllers/preventionistlist_controller.dart';


class PreventionistlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreventionistlistController>(() => PreventionistlistController());
  }
}