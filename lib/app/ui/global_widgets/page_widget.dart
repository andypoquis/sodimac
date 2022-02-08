import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/ui/pages/bottomsheetdetail_page/bottomsheetdetail_page.dart';
import 'package:sodimac/app/ui/theme/color.dart';
import 'card_role_list.dart';
import 'disable_Scroll_Color.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Widget headerWidget(controller, _controller, _controller2, _sizeScreen) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: primaryColor,
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i0.wp.com/i.pinimg.com/736x/21/cd/b1/21cdb1495a93764bf7f6bc62d5620b62.jpg'),
                  ),
                  spaceW(10),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${_controller.name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                        Text('${_controller.roleDescription}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ))
                      ]),
                  Expanded(child: Container()),
                  SizedBox(
                    width: 35,
                    child: Center(
                      child: IconButton(
                          onPressed: () => Get.bottomSheet(
                              Container(child: selectRangeDate(controller)),
                              backgroundColor: Colors.white),
                          icon: const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                    child: Center(
                      child: IconButton(
                          onPressed: () => _controller2.logout(),
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ))),
      // Container(
      //     padding: const EdgeInsets.all(15),
      //     height: 50,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: const [
      //         Text(
      //           'Sodimac Callao',
      //           style: TextStyle(fontSize: 16),
      //         ),
      //       ],
      //     )),
      Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: bgColor01,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.0))),
            child: Obx(() => ListView.builder(
                itemCount: controller.referenceGuidesList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        controller.postIdDetailGuide(
                            controller.referenceGuidesList[index].id);
                        bottomSheetContainer(_sizeScreen, controller,
                            controller.referenceGuidesList[index].id);
                      },
                      child: slidableWidget(index, _controller, controller));
                })),
          ))
    ],
  );
}

Future bottomSheetContainer(final _sizeScreen, controller, int id) {
  controller.fetchDetailReferenceGuide(id);
  return Get.bottomSheet(
    BottomsheetdetailPage(),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    isScrollControlled: true,
  );
}

Widget tagWidget(Color color, String? title, textColor, bool isIcon,
    [IconData? icon]) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    child: Row(
      children: [
        (isIcon)
            ? Icon(
                icon,
                color: textColor,
                size: 15,
              )
            : Container(),
        (isIcon) ? spaceW(10) : Container(),
        Text(title!, style: TextStyle(color: textColor)),
      ],
    ),
  );
}

Widget slidableWidget(int index, _controller, controller) {
  return Card(
    child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              label: 'Editar',
              backgroundColor: Colors.redAccent,
              icon: Icons.edit,
              onPressed: (context) => _controller.naavigatorDetailVaucher(
                  controller.referenceGuidesList[index].id),
            ),
          ],
        ),
        child: Obx(() => CardRole(
            controller.referenceGuidesList.value[index].correlative.toString(),
            controller.referenceGuidesList.value[index].carrier.toString(),
            controller.referenceGuidesList.value[index].destinyAddress
                .toString(),
            Icons.check,
            Colors.grey,
            'Sunat'))),
  );
}

Widget spaceH(double spaceH) {
  return SizedBox(height: spaceH);
}

Widget spaceW(double spaceW) {
  return SizedBox(width: spaceW);
}

Widget selectRangeDate(controller) {
  return Column(
    children: [
      SfDateRangePicker(
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) =>
            controller.onSelectionChanged(args),
        selectionMode: DateRangePickerSelectionMode.range,
      ),
      Obx(() {
        return Text((controller.range.value ?? 'Seleccionar fecha'));
      }),
      spaceH(25),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            maximumSize: const Size(200, 50), minimumSize: const Size(150, 50)),
        onPressed: () => controller.fetchReferenceGuides(),
        child: const Text('Filtrar'),
      )
    ],
  );
}
