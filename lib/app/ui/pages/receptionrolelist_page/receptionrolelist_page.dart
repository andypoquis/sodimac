import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/global_widgets/card_role_list.dart';
import 'package:sodimac/app/ui/theme/color.dart';
import '../../../controllers/receptionrolelist_controller.dart';

class ReceptionRoleListPage extends GetView<ReceptionRoleListController> {
  final _controller2 = Get.put(AuthenticateController());
  final _controller = Get.put(ReceptionRoleListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor01,
        appBar:
            AppBar(title: Text('${_controller.dataUser['name']}'), actions: [
          IconButton(
              onPressed: () => _controller2.logout(),
              icon: const Icon(Icons.logout))
        ]),
        body: SafeArea(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _controller.naavigatorDetailVaucher(index),
                  child: CardRole(
                      'GR-01-00000115',
                      'RONALD CONTRERAS GALINDO',
                      'Jr. Amonarca 325, Lima-Lima',
                      Icons.priority_high,
                      const Color(0xffF4D03F),
                      'Pendiente'),
                );
              }),
        ));
  }
}
