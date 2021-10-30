import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/controllers/authenticate_controller.dart';
import '../../../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginPage extends GetView<LoginController> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
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
              controller: emailController,
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
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AuthenticateController>(builder: (_) {
              return SizedBox(
                width: sizeScreen.width,
                child: ElevatedButton(
                    onPressed: () => _.authenticate(
                        emailController.text, passwordController.text),
                    child: const Text('Iniciar sesión')),
              );
            }),
          ],
        ));
  }
}
