import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/routes/app_pages.dart';

class TransportoperatorlistController extends GetxController {
  GetStorage box = GetStorage();
  get dataUser => box.read("data_user");

  RxInt selectIndex = 0.obs;

  naavigatorDetailVaucher(index) {
    selectIndex.value = index;
    Get.toNamed(Routes.VAUCHER_DETAIL);
  }
}
