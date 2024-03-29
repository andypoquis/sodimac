import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/data/models/detailReferenceGuide.dart';
import 'package:sodimac/app/data/services/remote_services.dart';
import 'package:sodimac/app/routes/app_pages.dart';

import 'camera_controller.dart';

class VaucherDetailController extends GetxController {
  final _controller2 = Get.put(CameraController());
  GetStorage box = GetStorage();
  RxInt roleIndex = 0.obs;
  RxInt countNavigator = 0.obs;
  RxBool buttonRoleEnabled = true.obs;
  RxString stateRoleText = 'Pendiente de recepción'.obs;
  RxBool isSuccessFulDelivery = false.obs;
  RxBool isLoading = false.obs;
  get dataUser => box.read("data_user");
  RxList<DataRow> dataRows = RxList<DataRow>();
  RxInt lengthDataProduct = 0.obs;
  @override
  void onInit() async {
    roleIndex.value = 0;
    if (0 == 2) {
      buttonRoleEnabled.value = false;
    }

    //print(roleIndex);
    super.onInit();
  }

  var detailReferenceGuideList = DetailReferenceGuide().obs;
  void fetchDetailReferenceGuide(int id) async {
    try {
      isLoading(true);
      List<DataRow> dataRowsAux = [];
      if (dataRows.isNotEmpty) {
        dataRows.value = dataRowsAux;
      }
      var detailReferenceGuide =
          await RemoteServices.fetchDetailReferenceGuide(id);

      if (detailReferenceGuide != null) {
        detailReferenceGuideList.value = detailReferenceGuide;
      }
    } finally {
      isLoading(false);
      lengthDataProduct.value =
          detailReferenceGuideList.value.referralGuide!.items!.length;
      getDataRows();
    }
  }

  List<DataRow> getDataRows() {
    int lengthData = lengthDataProduct.value;

    for (int i = 0; i < lengthData; i++) {
      dataRows.add(DataRow(cells: [
        DataCell(Text(detailReferenceGuideList.value.referralGuide!.items![i].id
            .toString())),
        DataCell(Text(
            '${detailReferenceGuideList.value.referralGuide!.items![i].line}')),
        DataCell(
          Text(
              '${detailReferenceGuideList.value.referralGuide!.items![i].productId}'),
        ),
        DataCell(Text(
            '${detailReferenceGuideList.value.referralGuide!.items![i].sku}')),
        DataCell(Text(
            '${detailReferenceGuideList.value.referralGuide!.items![i].productName}')),
        DataCell(
          Text(
              '${detailReferenceGuideList.value.referralGuide!.items![i].productFamily}'),
        ),
        DataCell(Text(
            '${detailReferenceGuideList.value.referralGuide!.items![i].unitMeasureId}')),
        DataCell(Text(
            '${detailReferenceGuideList.value.referralGuide!.items![i].unitMeasure}')),
        DataCell(
          Text(
              '${detailReferenceGuideList.value.referralGuide!.items![i].unitMeasureCode}'),
        ),
        DataCell(
          Text(
              '${detailReferenceGuideList.value.referralGuide!.items![i].quantity}'),
        ),
        DataCell(Text(
            '${detailReferenceGuideList.value.referralGuide!.items![i].ostId}')),
        DataCell(Text(
            '${detailReferenceGuideList.value.referralGuide!.items![i].ostNumber}')),
      ]));
    }

    return dataRows;
  }

  navigatorCameraSuccess() {
    _controller2.deleteDataPaths();
    countNavigator++;
    Get.back();
    Get.toNamed(Routes.CAMERA);
    isSuccessFulDelivery.value = true;
  }

  navigatorCameraRefused() {
    _controller2.deleteDataPaths();
    countNavigator++;
    Get.back();
    Get.toNamed(Routes.CAMERA);
    isSuccessFulDelivery.value = false;
  }

  disableButton() {
    buttonRoleEnabled.value = false;
    stateRoleText.value = 'Recepción aprobada';
  }
}
