import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/data/models/authenticate.dart';
import 'package:sodimac/app/data/services/remote_services.dart';
import 'package:sodimac/app/routes/app_pages.dart';

class AuthenticateController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isAuthenticate = false.obs;
  RxString username = "".obs;
  RxString password = "".obs;
  RxBool isLoading = false.obs;
  var authenticationList = Authenticate().obs;

  // get authenticate_value() {
  //   return false;
  // };

  @override
  void onInit() async {
    await GetStorage.init('isAuthenticate');

    if (box.read("isAuthenticate") != null) {
      isAuthenticate.value = box.read("isAuthenticate");
      if (isAuthenticate.value) {
        Get.offAllNamed(Routes.HOME);
      } else if (!isAuthenticate.value) {
        Get.offAllNamed(Routes.LOGIN);
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    super.onInit();
  }

  //HTTP APY
  void fetchAuthentication(String password, String username) async {
    try {
      isLoading(true);
      var authentication =
          await RemoteServices.fetchAuthentication(password, username);
      var detailAuthenticate =
          await RemoteServices.fetchDetailAuthentication(password, username);
      if (authentication != null && detailAuthenticate != null) {
        authenticationList.value = authentication;

        isAuthenticate.value = true;
        box.write("isAuthenticate", true);
        Get.offAllNamed(Routes.HOME);
        box.write("data_user", detailAuthenticate.toJson());
      }
    } finally {
      isLoading(false);
    }
  }

  logout() {
    isAuthenticate.value = false;
    box.write("isAuthenticate", false);
    box.remove("isAuthenticate");
    box.remove('data_user');
    Get.offAllNamed(Routes.LOGIN);
  }
}
