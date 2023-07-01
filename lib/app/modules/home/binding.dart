import 'package:get/get.dart';
import 'package:getx_posts/app/data/providers/posts_provider.dart';
import 'package:getx_posts/app/modules/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsProvider>(() => PostsProvider());
    Get.lazyPut<HomeController>(() => HomeController(postsProvider: Get.find()));
  }
}