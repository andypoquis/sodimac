import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controllers/camera_controller.dart';
import 'dart:io';

class CameraPage extends GetView<CameraController> {
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
          width: sizeScreen.width,
          height: sizeScreen.height,
          child: Center(
            child: Obx(() => controller.selectedImagePath.value == ''
                ? const Text('Seleccione una imagen')
                : Image.file(
                    File(controller.selectedImagePath.value),
                    fit: BoxFit.contain,
                  )),
          ),
        ),
      ),
    );
  }
}
