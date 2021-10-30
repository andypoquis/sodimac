import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sodimac/app/controllers/vaucherdetail_controller.dart';
import '../../../controllers/camera_controller.dart';
import 'dart:io';

class CameraPage extends GetView<CameraController> {
  final _controller = Get.put(VaucherDetailController());

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getImage(ImageSource.camera);
        },
        child: const Icon(Icons.camera_alt),
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(25),
            child: Obx(() {
              return (_controller.isSuccessFulDelivery.value)
                  ? aprovedDelivery(sizeScreen)
                  : refusedDelivery(sizeScreen);
            })),
      ),
    );
  }

  Widget aprovedDelivery(sizeScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          controller.expressionStateSuccess.value,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          controller.descriptonStateSuccess.value,
          style: (const TextStyle(fontSize: 16)),
        ),
        const SizedBox(
          height: 20,
        ),
        camera(sizeScreen),
        (controller.isImageLoad.value)
            ? Expanded(
                child: Center(
                  child: Container(
                    height: 40,
                    width: sizeScreen.width,
                    child: ElevatedButton(
                        onPressed: () {
                          _controller.disableButton();
                          Get.back();
                        },
                        child: const Text('ENVIAR')),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget refusedDelivery(sizeScreen) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            controller.expressionStateRefuse.value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            controller.descriptonStateRefuse.value,
            style: (const TextStyle(fontSize: 16)),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Motivo'),
          const SizedBox(
            height: 10,
          ),
          DropdownButton(
            isExpanded: true,
            items: const [],
            hint: const Text('Seleccione...'),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Detalles adicionales'),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
                hintMaxLines: 7,
                fillColor: Colors.red,
                hintText: 'Ingresa los dettalles aqui'),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          camera(sizeScreen),
          const SizedBox(
            height: 20,
          ),
          (controller.isImageLoad.value)
              ? Center(
                  child: SizedBox(
                    height: 40,
                    width: sizeScreen.width,
                    child: ElevatedButton(
                        onPressed: () {
                          _controller.disableButton();
                          Get.back();
                        },
                        child: const Text('ENVIAR')),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget camera(sizeScreen) {
    return SizedBox(
      width: sizeScreen.width,
      height: (_controller.isSuccessFulDelivery.value)
          ? sizeScreen.height * 0.45
          : sizeScreen.height * 0.25,
      child: Center(
        child: Obx(() => controller.selectedImagePath.value == ''
            ? const Text('Seleccione una imagen')
            : Image.file(
                File(controller.selectedImagePath.value),
                fit: BoxFit.contain,
              )),
      ),
    );
  }
}
