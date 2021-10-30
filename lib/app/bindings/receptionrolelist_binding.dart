
import 'package:get/get.dart';
import '../controllers/receptionrolelist_controller.dart';


class ReceptionRoleListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceptionRoleListController>(() => ReceptionRoleListController());
  }
}