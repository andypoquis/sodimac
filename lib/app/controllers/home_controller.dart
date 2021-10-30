import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/routes/app_pages.dart';

class HomeController extends GetxController {
  GetStorage box = GetStorage();
  RxInt selectIndex = 0.obs;
  RxInt roleIndex = 0.obs;

  get dataUser => box.read("data_user");

  @override
  void onInit() async {
    print('Se está iniciando');
    await GetStorage.init('type_user');

    roleIndex.value = dataUser['type_user'];
    super.onInit();
  }

  @override
  void onReady() {
    print('Estoy listo');
    super.onReady();
  }

  onItemTapped(int index) {
    selectIndex.value = index;
  }

  naavigatorDetailVaucher(index) {
    selectIndex.value = index;
    Get.toNamed(Routes.VAUCHER_DETAIL);
  }
}
