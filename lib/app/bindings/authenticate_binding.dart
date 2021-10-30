import 'package:get/get.dart';
import '../controllers/authenticate_controller.dart';

class AuthenticateBinding implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthenticateController>(() => AuthenticateController());
    Get.put(AuthenticateController());
  }
}
