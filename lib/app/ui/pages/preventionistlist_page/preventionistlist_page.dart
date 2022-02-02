import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/global_widgets/card_role_list.dart';
import 'package:sodimac/app/ui/global_widgets/disable_Scroll_Color.dart';
import 'package:sodimac/app/ui/global_widgets/page_widget.dart';
import 'package:sodimac/app/ui/theme/color.dart';
import '../../../controllers/preventionistlist_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PreventionistlistPage extends GetView<PreventionistlistController> {
  // @override
  // final _controller2 = Get.put(AuthenticateController());
  // final _controller = Get.put(PreventionistlistController());
  // Widget build(BuildContext context) {
  //   final _sizeScreen = MediaQuery.of(context).size;
  //   return ScrollConfiguration(
  //     behavior: MyBehavior(),
  //     child: Scaffold(
  //         backgroundColor: primaryColor,
  //         // appBar:
  //         //     AppBar(title: Text('${_controller.dataUser['name']}'), actions: [
  //         // IconButton(
  //         //     onPressed: () => _controller2.logout(),
  //         //     icon: const Icon(Icons.logout))
  //         // ]),
  //         body: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Expanded(
  //                 flex: 1,
  //                 child: Container(
  //                     padding: const EdgeInsets.symmetric(horizontal: 10),
  //                     color: primaryColor,
  //                     child: Row(
  //                       children: [
  //                         const CircleAvatar(
  //                           backgroundImage: NetworkImage(
  //                               'https://i0.wp.com/i.pinimg.com/736x/21/cd/b1/21cdb1495a93764bf7f6bc62d5620b62.jpg'),
  //                         ),
  //                         spaceW(10),
  //                         Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text('${_controller.dataUser['name']}',
  //                                   style: const TextStyle(
  //                                     color: Colors.white,
  //                                     fontWeight: FontWeight.w500,
  //                                     fontSize: 16,
  //                                   )),
  //                               Text('${_controller.dataUser['type']}',
  //                                   style: const TextStyle(
  //                                     color: Colors.white70,
  //                                     fontWeight: FontWeight.w500,
  //                                     fontSize: 12,
  //                                   ))
  //                             ]),
  //                         Expanded(child: Container()),
  //                         IconButton(
  //                             onPressed: () => _controller2.logout(),
  //                             icon: const Icon(
  //                               Icons.logout,
  //                               color: Colors.white,
  //                             ))
  //                       ],
  //                     ))),
  //             // Container(
  //             //     padding: const EdgeInsets.all(15),
  //             //     height: 50,
  //             //     child: Column(
  //             //       mainAxisAlignment: MainAxisAlignment.center,
  //             //       children: const [
  //             //         Text(
  //             //           'Sodimac Callao',
  //             //           style: TextStyle(fontSize: 16),
  //             //         ),
  //             //       ],
  //             //     )),
  //             Expanded(
  //                 flex: 6,
  //                 child: Container(
  //                   padding: const EdgeInsets.all(10),
  //                   decoration: const BoxDecoration(
  //                       color: bgColor01,
  //                       borderRadius:
  //                           BorderRadius.vertical(top: Radius.circular(20.0))),
  //                   child: ListView.builder(
  //                       itemCount: 5,
  //                       itemBuilder: (context, index) {
  //                         return GestureDetector(
  //                             onTap: () => bottomSheetContainer(_sizeScreen),
  //                             child: slidableWidget(index));
  //                       }),
  //                 )),
  //           ],
  //         )),
  //   );
  // }

  // Future bottomSheetContainer(final _sizeScreen) {
  //   return Get.bottomSheet(
  //     Container(
  //       padding: const EdgeInsets.only(top: 25),
  //       height: _sizeScreen.height * 0.75,
  //       child: ScrollConfiguration(
  //         behavior: MyBehavior(),
  //         child: SingleChildScrollView(
  //           controller: controller.scroll,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               spaceH(30),
  //               const Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 20),
  //                 child: Text(
  //                   'CLIENTE VARIOS',
  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               spaceH(5),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 15),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         tagWidget(const Color(0xffF2F3F4), 'GR-01-00000115',
  //                             Colors.black87, false),
  //                         spaceW(10),
  //                         tagWidget(const Color(0xffD6EAF8), 'Emitido',
  //                             const Color(0xff3498DB), true, Icons.send),
  //                         spaceW(10),
  //                         tagWidget(
  //                             const Color(0xffD6EAF8),
  //                             'Contado',
  //                             const Color(0xff3498DB),
  //                             true,
  //                             Icons.rate_review_outlined),
  //                       ],
  //                     ),
  //                     spaceH(35),
  //                     rowIconDescription(
  //                         const Color(0xffD6EAF8),
  //                         const Color(0xff3498DB),
  //                         Icons.store_mall_directory_outlined,
  //                         'ALMACÉN',
  //                         'Almacen Principal(AP)'),
  //                     spaceH(35),
  //                     const Text(
  //                       'DETALLE DE PRODUCTOS',
  //                       style: TextStyle(
  //                           color: primaryColor,
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.bold),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 child: Container(
  //                     width: 500,
  //                     child: DataTable(
  //                       columns: const [
  //                         DataColumn(label: Text('SKU')),
  //                         DataColumn(label: Text('Producto')),
  //                         DataColumn(label: Text('Cant')),
  //                       ],
  //                       rows: const [
  //                         DataRow(cells: [
  //                           DataCell(Text('B00001')),
  //                           DataCell(Text('Producto 01')),
  //                           DataCell(Text('5')),
  //                         ]),
  //                         DataRow(cells: [
  //                           DataCell(Text('B00002')),
  //                           DataCell(Text('Producto 02')),
  //                           DataCell(Text('2')),
  //                         ]),
  //                         DataRow(cells: [
  //                           DataCell(Text('B00003')),
  //                           DataCell(Text('Producto 03')),
  //                           DataCell(Text('46')),
  //                         ]),
  //                       ],
  //                     )),
  //               ),
  //               spaceH(25),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 15,
  //                 ),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const Text(
  //                       'HISTORIAL DE PROCESOS',
  //                       style: TextStyle(
  //                           color: primaryColor,
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     spaceH(15),
  //                     rowIconDescription(
  //                         const Color(0xffFADBD8),
  //                         const Color(0xffE74C3C),
  //                         Icons.date_range,
  //                         'FECHA DE REGISTRO',
  //                         '27 DICIEMBRE, 2021 6:28 PM'),
  //                     spaceH(25),
  //                     rowIconDescription(
  //                         const Color(0xffFADBD8),
  //                         const Color(0xffE74C3C),
  //                         Icons.date_range,
  //                         'FECHA DE REGISTRO',
  //                         '27 DICIEMBRE, 2021 6:28 PM'),
  //                     spaceH(25),
  //                     rowIconDescription(
  //                         const Color(0xffFADBD8),
  //                         const Color(0xffE74C3C),
  //                         Icons.date_range,
  //                         'FECHA DE REGISTRO',
  //                         '27 DICIEMBRE, 2021 6:28 PM'),
  //                     spaceH(25),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     isScrollControlled: true,
  //   );
  // }

  // Widget tagWidget(Color color, String title, textColor, bool isIcon,
  //     [IconData? icon]) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(5),
  //       color: color,
  //     ),
  //     child: Row(
  //       children: [
  //         (isIcon)
  //             ? Icon(
  //                 icon,
  //                 color: textColor,
  //                 size: 15,
  //               )
  //             : Container(),
  //         (isIcon) ? spaceW(10) : Container(),
  //         Text(title, style: TextStyle(color: textColor)),
  //       ],
  //     ),
  //   );
  // }

  // Widget rowIconDescription(Color bgColor, Color colorIcon, IconData icon,
  //     String title, String subtitle) {
  //   return Row(
  //     children: [
  //       CircleAvatar(
  //         backgroundColor: bgColor,
  //         child: Icon(
  //           icon,
  //           color: colorIcon,
  //         ),
  //       ),
  //       spaceW(10),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             title,
  //             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           spaceH(7),
  //           Text(subtitle,
  //               style: const TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w500,
  //                   color: subtitleColor)),
  //         ],
  //       )
  //     ],
  //   );
  // }

  // Widget slidableWidget(int index) {
  //   return Card(
  //     child: Slidable(
  //         endActionPane: ActionPane(
  //           motion: const DrawerMotion(),
  //           extentRatio: 0.25,
  //           children: [
  //             SlidableAction(
  //               label: 'Editar',
  //               backgroundColor: Colors.redAccent,
  //               icon: Icons.edit,
  //               onPressed: (context) =>
  //                   _controller.naavigatorDetailVaucher(index),
  //             ),
  //           ],
  //         ),
  //         child: CardRole(
  //             'GR-01-00000115',
  //             'RONALD CONTRERAS GALINDO',
  //             'Jr. Amonarca 325, Lima-Lima',
  //             Icons.check,
  //             Colors.grey,
  //             'Sunat')),
  //   );
  // }

  // Widget spaceH(double spaceH) {
  //   return SizedBox(height: spaceH);
  // }

  // Widget spaceW(double spaceW) {
  //   return SizedBox(width: spaceW);
  // }

  @override
  final _controller2 = Get.put(AuthenticateController());
  final _controller = Get.put(PreventionistlistController());
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Scaffold(
          backgroundColor: primaryColor,
          // appBar:
          //     AppBar(title: Text('${_controller.dataUser['name']}'), actions: [
          // IconButton(
          //     onPressed: () => _controller2.logout(),
          //     icon: const Icon(Icons.logout))
          // ]),
          body:
              headerWidget(controller, _controller, _controller2, _sizeScreen)),
    );
  }
}
