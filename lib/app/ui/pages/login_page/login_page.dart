import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import 'package:sodimac/app/ui/theme/color.dart';
import '../../../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor01,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: sizeScreen.width * 0.75,
            height: sizeScreen.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                grid1(sizeScreen),
                grid2(sizeScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget grid1(final sizedScreen) {
    return Expanded(
        flex: 1,
        child: SizedBox(
          width: sizedScreen.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 100, child: Image.asset('assets/sodimac.png')),
              Expanded(child: Container()),
              const Text(
                'Bienvenido',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Ingrese sus credenciales de acceso',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ));
  }

  Widget grid2(final sizeScreen) {
    return Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usuario',
              style: TextStyle(
                  color: Colors.primaries.first, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: controller.emailController,
              // decoration: const InputDecoration(icon: Icon(Icons.email)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Contraseña',
              style: TextStyle(
                  color: Colors.primaries.first, fontWeight: FontWeight.bold),
            ),
            TextField(
              obscureText: true,
              // decoration: const InputDecoration(icon: Icon(Icons.lock)),
              controller: controller.passwordController,
            ),
            const SizedBox(
              height: 25,
            ),
            GetBuilder<AuthenticateController>(builder: (_) {
              return SizedBox(
                width: sizeScreen.width,
                child: Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        maximumSize: const Size(200, 50),
                        minimumSize: const Size(150, 50)),
                    onPressed: (!_.isLoading.value)
                        ? () => _.fetchReferenceGuides(
                            controller.passwordController.text,
                            controller.emailController.text)
                        : null,
                    child: (!_.isLoading.value)
                        ? const Text('Iniciar sesión')
                        : const CircularProgressIndicator(
                            color: Color(0xffCACFD2),
                          ))),
              );
            }),
          ],
        ));
  }
}
