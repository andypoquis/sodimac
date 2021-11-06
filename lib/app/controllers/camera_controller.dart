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
  RxList pathImage = [].obs;

  RxString expressionStateSuccess = '¡Genail!'.obs;
  RxString descriptonStateSuccess = ''.obs;

  RxString expressionStateRefuse = '¡Oh no!'.obs;
  RxString descriptonStateRefuse = ''.obs;

  @override
  void onInit() async {
    await GetStorage.init('type_user');
    descriptonStateSuccess.value =
        '${dataUser['name']}, envianos tu evidencia y daremos por finalizado esta entrega.';
    descriptonStateRefuse.value =
        '${dataUser['name']}!, Este incidente no debio ocurrir. Cuentanos. ¿Qué salió mal? y sube una evidencia.';
    super.onInit();
  }

  @override
  void onClose() {
    box.remove('images_carrier');

    super.onClose();
  }

  void deleteDataPaths() {
    selectedImagePath.value = '';
    pathImage = [].obs;
  }

  void deleteImage(index) {
    pathImage.removeAt(index);
  }

  void onPressed() {
    box.write("images_carrier", pathImage);
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      // selectedImageSize.value =
      //     ((File(selectedImagePath.value))/1024 / 1024)
      //             .toStringAsFixed(2) +
      //         'MB';

      pathImage.add(selectedImagePath.value);

      isImageLoad.value = true;
    } else {
      Get.snackbar('Error', 'No seleccionó una imagen',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }
}
