import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VaucherDetailController extends GetxController {
  GetStorage box = GetStorage();
  RxInt roleIndex = 0.obs;
  RxBool buttonRoleEnabled = true.obs;
  RxString stateRoleText = 'Pendiente de recepción'.obs;
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

  disableButton() {
    buttonRoleEnabled.value = false;
    stateRoleText.value = 'Recepción aprobada';
  }
}
