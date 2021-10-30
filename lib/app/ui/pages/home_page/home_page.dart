import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/pages/carrierhomerol_page/carrierhomerol_page.dart';
import 'package:sodimac/app/ui/pages/preventionistlist_page/preventionistlist_page.dart';
import 'package:sodimac/app/ui/pages/receptionrolelist_page/receptionrolelist_page.dart';
import 'package:sodimac/app/ui/pages/transportoperatorlist_page/transportoperatorlist_page.dart';
import '../../../controllers/home_controller.dart';

// class HomePage extends GetView<HomeController> {
//   final _controller = Get.put(HomeController());
//   final _controller2 = Get.put(AuthenticateController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//                 onPressed: () => _controller2.logout(),
//                 icon: Icon(Icons.logout))
//           ],
//           title: Text('Hola ${controller.dataUser['name']}'),
//         ),
//         body: SafeArea(child: rolesContainer()));
//   }

//   Widget rolesContainer() {
//     initialize();
//     return GetBuilder<HomeController>(builder: (_) {
//       return Obx(() {
//         print(_.dataUser['type_user']);
//         switch (_.dataUser['type_user']) {
//           case 0:
//             return ReceptionRoleListPage();
//           case 1:
//             return PreventionistlistPage();
//           default:
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       });
//     });
//   }

//   void initialize() {
//     // inject authentication controller5
//     Get.lazyPut(
//       () => HomeController(),
//     );
//   }
// }

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Obx(() {
        return SafeArea(child: rolesContainer(_.roleIndex.value));
      });
    });
  }

  Widget rolesContainer(int roleIndex) {
    switch (roleIndex) {
      case 0:
        return PreventionistlistPage();
      case 1:
        return ReceptionRoleListPage();
      case 2:
        return TransportoperatorlistPage();
      case 3:
        return CarrierhomerolPage();
      default:
    }
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
