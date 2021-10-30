import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CameraController extends GetxController {
  GetStorage box = GetStorage();
  get dataUser => box.read("data_user");
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxBool isImageLoad = false.obs;

  RxString expressionStateSuccess = '¡Genail!'.obs;
  RxString descriptonStateSuccess = ''.obs;

  RxString expressionStateRefuse = '¡Genail!'.obs;
  RxString descriptonStateRefuse = ''.obs;

  @override
  void onInit() {
    descriptonStateSuccess.value =
        'La entrega se ha realizado sin inconvenientes, acontinuación sube una evidencia de la entrega.';
    super.onInit();
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      // selectedImageSize.value =
      //     ((File(selectedImagePath.value))/1024 / 1024)
      //             .toStringAsFixed(2) +
      //         'MB';

      isImageLoad.value = true;
      expressionStateSuccess.value = '¡Gracias!';
      descriptonStateSuccess.value =
          '${dataUser['name']}, envianos tu evidencia y daremos por finalizado esta entrega.';
    } else {
      Get.snackbar('Error', 'No seleccionó una imagen',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }
}
