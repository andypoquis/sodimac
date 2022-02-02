import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/data/models/referenceGuides.dart';
import 'package:sodimac/app/data/services/remote_services.dart';
import 'package:sodimac/app/routes/app_pages.dart';

class PreventionistlistController extends GetxController {
  GetStorage box = GetStorage();
  get dataUser => box.read("data_user");
  RxInt selectIndex = 0.obs;
  RxBool isTop = false.obs;
  ScrollController scroll = ScrollController();

  var referenceGuidesList = List<ReferenceGuides>.empty().obs;

  naavigatorDetailVaucher(index) {
    selectIndex.value = index;
    Get.toNamed(Routes.VAUCHER_DETAIL);
  }

  @override
  void onInit() {
    fetchReferenceGuides();
    print(referenceGuidesList);
    super.onInit();
  }

  void fetchReferenceGuides() async {
    var referenceGuides = await RemoteServices.fetchReferenceGuides();
    if (referenceGuides != null) {
      referenceGuidesList.value = referenceGuides;
      print(referenceGuidesList.value[0].id);
    }
  }
}
