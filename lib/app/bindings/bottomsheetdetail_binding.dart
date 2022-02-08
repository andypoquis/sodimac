
import 'package:get/get.dart';
import '../controllers/bottomsheetdetail_controller.dart';


class BottomsheetdetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomsheetdetailController>(() => BottomsheetdetailController());
  }
}