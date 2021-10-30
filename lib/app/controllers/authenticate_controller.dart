import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/routes/app_pages.dart';

class AuthenticateController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isAuthenticate = false.obs;

  // get authenticate_value() {
  //   return false;
  // };

  List<Map> dataUser = [
    {
      'email': 'usuario1',
      'pass': '1234',
      'name': 'Prevencionista',
      'type_user': 0,
    },
    {
      'email': 'usuario2',
      'pass': '1234',
      'name': 'Asesor de recepción',
      'type_user': 1,
    },
    {
      'email': 'usuario3',
      'pass': '1234',
      'name': 'Operador de transporte',
      'type_user': 2,
    },
    {
      'email': 'usuario4',
      'pass': '1234',
      'name': 'Transportista',
      'type_user': 3,
    },
  ];

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

  authenticate(String email, String pass) {
    for (int i = 0; i < dataUser.length; i++) {
      if (dataUser[i]['email'] == email && dataUser[i]['pass'] == pass) {
        isAuthenticate.value = true;
        box.write("isAuthenticate", true);
        box.write("data_user", dataUser[i]);
        i = dataUser.length;

        Get.offAllNamed(Routes.HOME);
      }
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
