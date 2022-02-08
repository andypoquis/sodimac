import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/controllers/bottomsheetdetail_controller.dart';
import 'package:sodimac/app/data/models/detailReferenceGuide.dart';
import 'package:sodimac/app/data/models/referenceGuides.dart';
import 'package:sodimac/app/data/services/remote_services.dart';
import 'package:sodimac/app/routes/app_pages.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import 'vaucherdetail_controller.dart';

class PreventionistlistController extends GetxController {
  GetStorage box = GetStorage();
  get dataUser => box.read("data_user");
  RxInt selectIndex = 0.obs;
  RxBool isTop = false.obs;
  ScrollController scroll = ScrollController();
  RxString rangeCount = ''.obs;
  RxString range = ''.obs;
  RxString initRangeDate = '2021/01/01'.obs;
  RxString endRangeDate = '2022/02/01'.obs;
  RxString name = ''.obs;
  RxString roleDescription = ''.obs;
  var referenceGuidesList = List<ReferenceGuides>.empty().obs;
  RxBool isLoading = false.obs;
  final _controller = Get.put(BottomsheetdetailController());
  final _controller2 = Get.put(VaucherDetailController());

  RxInt id = 0.obs;
  var detailReferenceGuideList = DetailReferenceGuide().obs;

  naavigatorDetailVaucher(id) {
    _controller2.fetchDetailReferenceGuide(id);
    Get.toNamed(Routes.VAUCHER_DETAIL);
  }

  postIdDetailGuide(int id) {
    _controller2.fetchDetailReferenceGuide(id);
    _controller.fetchDetailReferenceGuide(id);
  }

  @override
  void onInit() {
    fetchReferenceGuides();
    name.value = dataUser['usuario']['nombres'];
    roleDescription.value = dataUser['roles'][0]['nombre'];
    super.onInit();
  }

  //HTTP APY
  void fetchReferenceGuides() async {
    var referenceGuides =
        await RemoteServices.fetchReferenceGuides(endRangeDate, initRangeDate);
    if (referenceGuides != null) {
      referenceGuidesList.value = referenceGuides;
      referenceGuides[0].id;
    }
  }

  void fetchDetailReferenceGuide(int id) async {
    try {
      isLoading(true);
      var detailReferenceGuide =
          await RemoteServices.fetchDetailReferenceGuide(id);

      if (detailReferenceGuide != null) {
        detailReferenceGuideList.value = detailReferenceGuide;
        detailReferenceGuide.referralGuide?.serie;
      }
    } finally {
      isLoading(false);
    }
  }

  //DateSelection
  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      initRangeDate.value =
          DateFormat('dd/MM/yyyy').format(args.value.startDate);
      endRangeDate.value = DateFormat('dd/MM/yyyy')
          .format(args.value.endDate ?? args.value.startDate);
      range.value = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    } else {
      rangeCount.value = args.value.length.toString();
    }
  }
}
