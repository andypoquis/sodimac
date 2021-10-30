
import 'package:get/get.dart';
import '../controllers/transportoperatorlist_controller.dart';


class TransportoperatorlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransportoperatorlistController>(() => TransportoperatorlistController());
  }
}