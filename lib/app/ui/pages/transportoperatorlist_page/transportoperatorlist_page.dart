import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/global_widgets/card_role_list.dart';
import '../../../controllers/transportoperatorlist_controller.dart';

class TransportoperatorlistPage
    extends GetView<TransportoperatorlistController> {
  final _controller2 = Get.put(AuthenticateController());
  final _controller = Get.put(TransportoperatorlistController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar:
            AppBar(title: Text('${_controller.dataUser['name']}'), actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      height: screenSize.height * 0.25,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Enviar Excel de Guías',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const Text('Correo Electronico'),
                          const TextField(
                            enabled: false,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.red,
                                hintText: 'example@gmail.com'),
                            // decoration: const InputDecoration(icon: Icon(Icons.lock)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: screenSize.width,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('Enviar')),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white);
              },
              icon: const Icon(Icons.mail)),
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
