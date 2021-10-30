import 'package:get/get.dart';
import 'package:sodimac/app/bindings/authenticate_binding.dart';
import 'package:sodimac/app/bindings/camera_binding.dart';
import 'package:sodimac/app/bindings/home_binding.dart';
import 'package:sodimac/app/bindings/login_binding.dart';
import 'package:sodimac/app/bindings/vaucherdetail_binding.dart';
import 'package:sodimac/app/ui/pages/authenticate_page/authenticate_page.dart';
import 'package:sodimac/app/ui/pages/camera_page/camera_page.dart';
import 'package:sodimac/app/ui/pages/home_page/home_page.dart';
import 'package:sodimac/app/ui/pages/login_page/login_page.dart';
import 'package:sodimac/app/ui/pages/splash_page/splash_page.dart';
import 'package:sodimac/app/ui/pages/vaucherdetail_page/vaucherdetail_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.AUTHENTICATE,
      page: () => AuthenticatePage(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.VAUCHER_DETAIL,
      page: () => VaucherDetailPage(),
      binding: VaucherDetailBinding(),
    ),
    GetPage(
      name: Routes.CAMERA,
      page: () => CameraPage(),
      binding: CameraBinding(),
    ),
  ];
}
