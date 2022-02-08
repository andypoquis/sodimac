import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/ui/global_widgets/disable_Scroll_Color.dart';
import 'package:sodimac/app/ui/global_widgets/page_widget.dart';
import 'package:sodimac/app/ui/theme/color.dart';
import '../../../controllers/bottomsheetdetail_controller.dart';

class BottomsheetdetailPage extends GetView<BottomsheetdetailController> {
  final _controller = Get.put(BottomsheetdetailController());
  List<DataRow>? dataRows = [];
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 25),
      height: _sizeScreen.height * 0.75,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceH(30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'CLIENTE VARIOS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              spaceH(5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Row(
                          children: [
                            tagWidget(
                                const Color(0xffF2F3F4),
                                (_controller.detailReferenceGuideList.value
                                            .referralGuide?.serie !=
                                        null)
                                    ? _controller.detailReferenceGuideList.value
                                        .referralGuide?.correlative
                                    : '',
                                Colors.black87,
                                false),
                            spaceW(10),
                            tagWidget(const Color(0xffD6EAF8), 'Emitido',
                                const Color(0xff3498DB), true, Icons.send),
                            spaceW(10),
                            tagWidget(
                                const Color(0xffD6EAF8),
                                'Contado',
                                const Color(0xff3498DB),
                                true,
                                Icons.rate_review_outlined),
                          ],
                        )),
                    spaceH(35),
                    rowIconDescription(
                        const Color(0xffD6EAF8),
                        const Color(0xff3498DB),
                        Icons.store_mall_directory_outlined,
                        'ALMACÉN',
                        'Almacen Principal(AP)'),
                    spaceH(35),
                    const Text(
                      'DETALLE DE PRODUCTOS',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(width: 1500, child: dataTableProduct()),
              ),
              spaceH(25),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'HISTORIAL DE PROCESOS',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        spaceH(15),
                        rowIconDescription(
                            const Color(0xffFADBD8),
                            const Color(0xffE74C3C),
                            Icons.date_range,
                            'FECHA DE REGISTRO',
                            (controller.detailReferenceGuideList.value
                                        .referralGuide?.registeredAt !=
                                    null)
                                ? controller.detailReferenceGuideList.value
                                    .referralGuide?.registeredAt
                                : ''),
                        spaceH(25),
                        rowIconDescription(
                            const Color(0xffFADBD8),
                            const Color(0xffE74C3C),
                            Icons.date_range,
                            'FECHA DE EMISIÓN',
                            (controller.detailReferenceGuideList.value
                                        .referralGuide?.emissionDate !=
                                    null)
                                ? controller.detailReferenceGuideList.value
                                    .referralGuide?.emissionDate
                                : ''),
                        spaceH(25),
                        // rowIconDescription(
                        //     const Color(0xffFADBD8),
                        //     const Color(0xffE74C3C),
                        //     Icons.date_range,
                        //     'FECHA DE REGISTRO',
                        //     '27 DICIEMBRE, 2021 6:28 PM'),
                        // spaceH(25),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dataTableProduct() {
    return Obx(() {
      return DataTable(columns: const [
        DataColumn(label: Text('id')),
        DataColumn(label: Text('line')),
        DataColumn(label: Text('productId')),
        DataColumn(label: Text('SKU')),
        DataColumn(label: Text('productName')),
        DataColumn(label: Text('productFamily')),
        DataColumn(label: Text('unitMeasureId')),
        DataColumn(label: Text('unitMeasure')),
        DataColumn(label: Text('unitMeasureCode')),
        DataColumn(label: Text('quantity')),
        DataColumn(label: Text('ostId')),
        DataColumn(label: Text('ostNumber')),
      ], rows: _controller.dataRows);
    });
  }

  List<DataRow> getDataRows() {
    int lengthData = _controller.lengthDataProduct.value;
    List<DataRow>? dataRows = [];
    for (int i = 0; i < lengthData; i++) {
      _controller.getDataProduct(i);
      dataRows.add(DataRow(cells: [
        DataCell(Text(_controller.idItem.value)),
        DataCell(Text(_controller.line.value)),
        DataCell(
          Text(_controller.productId.value),
        ),
        DataCell(Text(_controller.sku.value)),
        DataCell(Text(_controller.productName.value)),
        DataCell(
          Text(_controller.productFamily.value),
        ),
        DataCell(Text(_controller.unitMeasureId.value)),
        DataCell(Text(_controller.unitMeasure.value)),
        DataCell(
          Text(_controller.unitMeasureCode.value),
        ),
        DataCell(
          Text(_controller.quantity.value),
        ),
        DataCell(Text(_controller.ostId.value)),
        DataCell(Text(_controller.ostNumber.value)),
      ]));
    }

    return dataRows;
  }

  Widget rowIconDescription(Color bgColor, Color colorIcon, IconData icon,
      String? title, String? subtitle) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: bgColor,
          child: Icon(
            icon,
            color: colorIcon,
          ),
        ),
        spaceW(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            spaceH(7),
            Text(subtitle!,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: subtitleColor)),
          ],
        )
      ],
    );
  }
}
