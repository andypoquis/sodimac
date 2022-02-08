import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/data/models/detailReferenceGuide.dart';
import 'package:sodimac/app/data/services/remote_services.dart';

class BottomsheetdetailController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt id = (0).obs;

  RxString idItem = "".obs;
  RxString line = "".obs;
  RxString productId = "".obs;
  RxString sku = "".obs;
  RxString productName = "".obs;
  RxString productFamily = "".obs;
  RxString unitMeasureId = "".obs;
  RxString unitMeasure = "".obs;
  RxString unitMeasureCode = "".obs;
  RxString quantity = "".obs;
  RxString ostId = "".obs;
  RxString ostNumber = "".obs;

  RxInt lengthDataProduct = 0.obs;

  RxList<DataRow> dataRows = RxList<DataRow>();

  // @override
  // void onInit() {
  //   fetchDetailReferenceGuide(id.value);
  //   super.onInit();
  // }

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
      detailReferenceGuideList.value.referralGuide?.registeredAt;
      getDataRows();
    }
  }

  getDataProduct(i) {
    if (isLoading(false)) {
      idItem.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].id}';
      line.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].line}';
      productId.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].productId}';
      sku.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].sku}';
      productName.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].productName}';
      productFamily.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].productFamily}';
      unitMeasureId.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].unitMeasureId}';
      unitMeasure.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].unitMeasure}';
      unitMeasureCode.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].unitMeasureCode}';
      quantity.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].quantity}';
      ostId.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].ostId}';

      ostNumber.value =
          '${detailReferenceGuideList.value.referralGuide!.items![i].ostNumber}';
    }
  }

  List<DataRow> getDataRows() {
    int lengthData = lengthDataProduct.value;

    for (int i = 0; i < lengthData; i++) {
      getDataProduct(i);
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
}
