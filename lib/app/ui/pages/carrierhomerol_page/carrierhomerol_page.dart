import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/global_widgets/card_role_list.dart';
import '../../../controllers/carrierhomerol_controller.dart';

class CarrierhomerolPage extends GetView<CarrierhomerolController> {
  final _controller2 = Get.put(AuthenticateController());
  final _controller = Get.put(CarrierhomerolController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                      const Color(0xff2ECC71),
                      'Aprobado'),
                );
              }),
        ));
  }
}
