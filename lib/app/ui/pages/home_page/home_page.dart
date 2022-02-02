import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/pages/carrierhomerol_page/carrierhomerol_page.dart';
import 'package:sodimac/app/ui/pages/preventionistlist_page/preventionistlist_page.dart';
import 'package:sodimac/app/ui/pages/receptionrolelist_page/receptionrolelist_page.dart';
import 'package:sodimac/app/ui/pages/transportoperatorlist_page/transportoperatorlist_page.dart';
import 'package:sodimac/app/ui/theme/color.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final _controller2 = Get.put(AuthenticateController());
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

  Widget headerWidget() {
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
                          Text('${controller.dataUser['name']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                          Text('${controller.dataUser['type']}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ))
                        ]),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () => _controller2.logout(),
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ))
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
                child: Container()))
      ],
    );
  }

  Widget spaceH(double spaceH) {
    return SizedBox(height: spaceH);
  }

  Widget spaceW(double spaceW) {
    return SizedBox(width: spaceW);
  }
}
