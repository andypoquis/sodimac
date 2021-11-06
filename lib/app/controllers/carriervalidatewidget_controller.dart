import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CarriervalidatewidgetController extends GetxController {
  GetStorage box = GetStorage();
  get images_carrier => box.read("images_carrier");
}
