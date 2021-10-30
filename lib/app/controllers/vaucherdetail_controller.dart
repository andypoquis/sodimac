import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/routes/app_pages.dart';

class VaucherDetailController extends GetxController {
  GetStorage box = GetStorage();
  RxInt roleIndex = 0.obs;
  RxBool buttonRoleEnabled = true.obs;
  RxString stateRoleText = 'Pendiente de recepción'.obs;
  RxBool isSuccessFulDelivery = false.obs;
  get dataUser => box.read("data_user");

  @override
  void onInit() async {
    roleIndex.value = dataUser['type_user'];
    if (dataUser['type_user'] == 2) {
      buttonRoleEnabled.value = false;
    }

    //print(roleIndex);
    super.onInit();
  }

  navigatorCameraSuccess() {
    Get.back();
    Get.toNamed(Routes.CAMERA);
    isSuccessFulDelivery.value = true;
  }

  navigatorCameraRefused() {
    Get.back();
    Get.toNamed(Routes.CAMERA);
    isSuccessFulDelivery.value = false;
  }

  disableButton() {
    buttonRoleEnabled.value = false;
    stateRoleText.value = 'Recepción aprobada';
  }
}
