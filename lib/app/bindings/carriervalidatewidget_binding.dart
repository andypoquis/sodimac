
import 'package:get/get.dart';
import '../controllers/carriervalidatewidget_controller.dart';


class CarriervalidatewidgetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarriervalidatewidgetController>(() => CarriervalidatewidgetController());
  }
}