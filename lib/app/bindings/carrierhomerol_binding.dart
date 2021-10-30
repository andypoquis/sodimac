
import 'package:get/get.dart';
import '../controllers/carrierhomerol_controller.dart';


class CarrierhomerolBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarrierhomerolController>(() => CarrierhomerolController());
  }
}