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

  Widget buttonPass(
      final sizeScreen, BuildContext context, String title, int indexRole) {
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
                  onPressed: () => onPressedOperation(indexRole, context),
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

  Widget roleButton(final sizeScreen, BuildContext context) {
    return Obx(() {
      if (_controller.buttonRoleEnabled.value) {
        switch (_controller.roleIndex.value) {
          case 0:
            return buttonPass(sizeScreen, context, 'APROBAR', 0);
          case 1:
            return buttonPass(sizeScreen, context, 'APROBAR RECEPCIÓN', 1);
          case 3:
            return buttonPass(sizeScreen, context, 'FINALIZAR ENTREGA', 3);
        }
      } else {
        return Container();
      }
      return Container();
    });
  }

  Widget stateRoleText() {
    return Obx(() {
      switch (_controller.roleIndex.value) {
        case 0:
          return descriptionWidget('Estado', 'Aprobado por SUNAT');
        case 1:
          return descriptionWidget(
              'Estado', '${_controller.stateRoleText.value}');
        case 2:
          return Container();
        case 3:
          return descriptionWidget('Estado', 'Aprobado Home Delivery');
        default:
      }
      return Container();
    });
  }

  void onPressedOperation(int indexRole, BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    switch (indexRole) {
      case 0:
        _controller.disableButton();
        menssagePass(context);
        break;
      case 1:
        _controller.disableButton();
        menssagePass(context);
        break;
      case 3:
        carrierOptions(screenSize);

        break;
      default:
    }
  }

  void carrierOptions(screenSize) {
    Get.bottomSheet(
        Container(
          height: screenSize.height * 0.35,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Finalizar Entrega',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Por favor seleccione una opcción conforme haya ocurrido la entrega'),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: () => _controller.navigatorCamera(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'ENTREGA EXITOSA',
                          style: TextStyle(fontSize: 14),
                        ),
                        Expanded(child: Container()),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Text(
                        'LA ENTREGA NO SE CONCRETÓ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white);
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

  // Widget rowWidget(){
  //   return
  // }
}
