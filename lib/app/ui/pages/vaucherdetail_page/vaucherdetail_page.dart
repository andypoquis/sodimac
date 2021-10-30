import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/vaucherdetail_controller.dart';

class VaucherDetailPage extends GetView<VaucherDetailController> {
  final _controller = Get.put(VaucherDetailController());
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GR-01-000000115'),
      ),
      body: SafeArea(
        child: Column(children: [
          descriptionDetail(),
          tableWidget(),
          roleButton(_sizeScreen, context)
        ]),
      ),
    );
  }

  Widget descriptionDetail() {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  child: descriptionWidget(
                      'Cliente', 'Rosald Contresaras Galindo')),
              const Divider(),
              Expanded(
                  child: descriptionWidget('Dirección', 'Jr. Amonarca 325')),
              const Divider(),
              Expanded(
                child: stateRoleText(),
              ),
              const Divider(),
              Expanded(child: descriptionWidget('Listado de items', '')),
            ],
          ),
        ));
  }

  Widget buttonPass(final sizeScreen, BuildContext context, String title) {
    return Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: sizeScreen.width * 0.8,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    _controller.disableButton();
                    menssagePass(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10.0), child: Text(title))),
            ),
          ],
        ));
  }

  Widget descriptionWidget(String title, String description) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          description,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget tableWidget() {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Container(
            height: 35,
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xffE5E5E5),
            child: Row(
              //HEAD
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(flex: 2, child: Text('SKU')),
                Expanded(flex: 4, child: Text('Producto')),
                Expanded(flex: 1, child: Text('Cant.')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.white,
                    height: 50.0,
                    child: Column(
                      children: [
                        Row(
                          //HEAD
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(flex: 2, child: Text('B00001')),
                            Expanded(flex: 4, child: Text('Producto 001')),
                            Expanded(flex: 1, child: Text('5')),
                          ],
                        ),
                        const Divider()
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  void menssagePass(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
              height: 50.0,
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 45,
              ),
            ),
            content: const Text('Aprobación realizada con éxito'),
          );
        });
  }

  Widget roleButton(final sizeScreen, BuildContext context) {
    return Obx(() {
      if (_controller.buttonRoleEnabled.value) {
        if (_controller.roleIndex.value == 0) {
          return buttonPass(
            sizeScreen,
            context,
            'APROBAR',
          );
        } else {
          return buttonPass(sizeScreen, context, 'APROBAR RECEPCIÓN');
        }
      } else {
        return Container();
      }
    });
  }

  Widget stateRoleText() {
    return Obx(() {
      if (_controller.roleIndex.value == 0) {
        return descriptionWidget('Estado', 'Aprobado por SUNAT');
      } else {
        return descriptionWidget(
            'Estado', '${_controller.stateRoleText.value}');
      }
    });
  }

  // Widget rowWidget(){
  //   return
  // }
}
