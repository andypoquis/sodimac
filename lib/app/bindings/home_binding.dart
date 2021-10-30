import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    //Get.lazyPut<AuthenticateController>(() => AuthenticateController());
  }
}
