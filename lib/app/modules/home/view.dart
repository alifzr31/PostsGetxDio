import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_posts/app/core/utils/bottomSheetGetx.dart';
import 'package:getx_posts/app/modules/home/controller.dart';
import 'package:getx_posts/app/modules/widgets/detail_posts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Posts'),
        centerTitle: true,
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  final controller = Get.find<HomeController>();

  Future<void> refreshPosts() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      controller.refreshPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Posts Data : ${controller.posts.length}'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: refreshPosts,
                      child: ListView.builder(
                        itemCount: controller.posts.length,
                        itemBuilder: (context, index) {
                          final posts = controller.posts[index];

                          return ListTile(
                            leading: Text(
                              '${index + 1}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            title: Text(
                              posts.title ?? '',
                              style: const TextStyle(fontSize: 14),
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                controller.id.value = posts.id ?? 0;
                                bottomSheetGetx(const DetailPostsBottomSheet());
                              },
                              child: const Text('Show Detail'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
