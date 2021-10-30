import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodimac/app/ui/theme/color.dart';
import 'app/bindings/authenticate_binding.dart';
import 'app/routes/app_pages.dart';

// main() async {
//   await GetStorage.init();
//   await GetStorage.init('isAuthenticate');
//   await GetStorage.init('type_user');
//   initialize();
//   runApp(MyApp());
// }

// void initialize() {
//   // inject authentication controller5
//   Get.lazyPut(
//     () => AuthenticateController(),
//   );
// }

// class MyApp extends GetWidget<AuthenticateController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'SODIMAC',
//       theme: ThemeData(
//         primarySwatch: MaterialColor(0xFFE74C3C, color),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         textTheme: const TextTheme(
//           headline1: TextStyle(
//               color: Color(0xff404040),
//               fontSize: 72.0,
//               fontWeight: FontWeight.bold),
//           bodyText2: TextStyle(
//             color: Color(0xff404040),
//             fontSize: 12.0,
//           ),
//         ),
//       ),
//       // theme: appThemeData,
//       debugShowCheckedModeBanner: false,
//       getPages: AppPages.pages,
//       home: Obx(() {
//         GetStorage box = GetStorage();

//         if (!controller.isAuthenticate.value) {
//           return LoginPage();
//         } else {
//           return HomePage();
//         }
//       }),
//     );
//   }
// }

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    theme: ThemeData(
      primarySwatch: MaterialColor(0xFFE74C3C, color),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xff404040),
            fontSize: 72.0,
            fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
          color: Color(0xff404040),
          fontSize: 12.0,
        ),
      ),
    ),
    defaultTransition: Transition.fade,
    initialBinding: AuthenticateBinding(),
    getPages: AppPages.pages,
  ));
}
