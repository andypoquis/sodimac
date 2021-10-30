
import 'package:get/get.dart';
import '../controllers/vaucherdetail_controller.dart';


class VaucherDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VaucherDetailController>(() => VaucherDetailController());
  }
}