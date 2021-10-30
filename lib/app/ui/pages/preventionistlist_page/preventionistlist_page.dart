import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/global_widgets/card_role_list.dart';
import '../../../controllers/preventionistlist_controller.dart';

class PreventionistlistPage extends GetView<PreventionistlistController> {
  @override
  Widget build(BuildContext context) {
    final _controller2 = Get.put(AuthenticateController());
    final _controller = Get.put(PreventionistlistController());
    return Scaffold(
        appBar:
            AppBar(title: Text('${_controller.dataUser['name']}'), actions: [
          IconButton(
              onPressed: () => _controller2.logout(),
              icon: const Icon(Icons.logout))
        ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sodimac Callao',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _controller.naavigatorDetailVaucher(index),
                        child: CardRole(
                            'GR-01-00000115',
                            'RONALD CONTRERAS GALINDO',
                            'Jr. Amonarca 325, Lima-Lima',
                            Icons.check,
                            Colors.grey,
                            'Sunat'),
                      );
                    })),
          ],
        ));
  }
}
