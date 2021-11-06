import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sodimac/app/controllers/camera_controller.dart';
import 'package:sodimac/app/controllers/vaucherdetail_controller.dart';
import '../../../controllers/carriervalidatewidget_controller.dart';

class CarriervalidatewidgetPage
    extends GetView<CarriervalidatewidgetController> {
  final _controller = Get.put(VaucherDetailController());
  final _controller2 = Get.put(CameraController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (!_controller.buttonRoleEnabled.value)
          ? SizedBox(
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _controller2.pathImage.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Image.file(
                                    File(_controller2.pathImage[index]),
                                    fit: BoxFit.contain,
                                  ),
                                  (_controller2.pathImage.length != 2)
                                      ? Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.redAccent),
                                            child: IconButton(
                                              onPressed: () => _controller2
                                                  .deleteImage(index),
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              ));
                        }),
                  ),
                  (_controller2.pathImage.length < 2)
                      ? IconButton(
                          onPressed: () =>
                              _controller2.getImage(ImageSource.camera),
                          icon: const Icon(Icons.camera))
                      : Container()
                ],
              ),
            )
          : Container();
    });
  }
}
