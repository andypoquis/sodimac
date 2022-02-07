import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sodimac/app/data/models/authenticate.dart';
import 'package:sodimac/app/data/models/detailAuthenticate.dart';
import 'package:sodimac/app/data/services/remote_services.dart';
import 'package:sodimac/app/routes/app_pages.dart';

class AuthenticateController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isAuthenticate = false.obs;
  RxString username = "".obs;
  RxString password = "".obs;
  RxBool isLoading = false.obs;
  var authenticationList = Authenticate().obs;

  // get authenticate_value() {
  //   return false;
  // };

  List<Map> dataUser = [
    {
      'email': 'usuario1',
      'pass': '1234',
      'name': 'Andrés Enrique Poquis Chávez',
      'type': 'Prevencionista',
      'type_user': 0,
      'estate': 'SUNAT'
    },
    {
      'email': 'usuario2',
      'pass': '1234',
      'name': 'Enrique Poquis',
      'type': 'Asesor de recepción',
      'estate': 'Pendiente',
      'type_user': 1,
    },
    {
      'email': 'usuario3',
      'pass': '1234',
      'name': 'Poquis Andy',
      'type': 'Operador de transporte',
      'estate': 'Aprobado',
      'type_user': 2,
    },
    {
      'email': 'usuario4',
      'pass': '1234',
      'type': 'Transportista',
      'name': 'Andy Poquis',
      'type_user': 3,
    },
  ];

  @override
  void onInit() async {
    await GetStorage.init('isAuthenticate');

    if (box.read("isAuthenticate") != null) {
      isAuthenticate.value = box.read("isAuthenticate");
      if (isAuthenticate.value) {
        Get.offAllNamed(Routes.HOME);
      } else if (!isAuthenticate.value) {
        Get.offAllNamed(Routes.LOGIN);
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    super.onInit();
  }

  authenticate(String email, String pass) {
    for (int i = 0; i < dataUser.length; i++) {
      if (dataUser[i]['email'] == email && dataUser[i]['pass'] == pass) {
        isAuthenticate.value = true;
        box.write("isAuthenticate", true);
        box.write("data_user", dataUser[i]);
        i = dataUser.length;

        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  //HTTP APY
  void fetchReferenceGuides(String password, String username) async {
    try {
      isLoading(true);
      var authentication =
          await RemoteServices.fetchAuthentication(password, username);
      var detailAuthenticate =
          await RemoteServices.fetchDetailAuthentication(password, username);
      if (authentication != null && detailAuthenticate != null) {
        authenticationList.value = authentication;

        isAuthenticate.value = true;
        box.write("isAuthenticate", true);
        Get.offAllNamed(Routes.HOME);
        box.write("data_user", detailAuthenticate.toJson());
      }
    } finally {
      isLoading(false);
    }
  }

  logout() {
    isAuthenticate.value = false;
    box.write("isAuthenticate", false);
    box.remove("isAuthenticate");
    box.remove('data_user');
    Get.offAllNamed(Routes.LOGIN);
  }
}
