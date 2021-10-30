import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/ui/pages/home_page/home_page.dart';
import 'package:sodimac/app/ui/pages/login_page/login_page.dart';
import '../../../controllers/authenticate_controller.dart';

class AuthenticatePage extends GetView<AuthenticateController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticateController>(builder: (_) {
      return Obx(() {
        if (_.isAuthenticate.value) {
          return LoginPage();
        }
        if (!_.isAuthenticate.value) {
          return HomePage();
        }
        return Container();
        //return Container();
      });
    });
  }
}
