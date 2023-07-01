import 'package:get/get.dart';
import 'package:getx_posts/app/modules/home/binding.dart';
import 'package:getx_posts/app/modules/home/view.dart';
import 'package:getx_posts/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
