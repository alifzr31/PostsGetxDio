import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_posts/app/modules/home/controller.dart';

class DetailPostsBottomSheet extends StatefulWidget {
  const DetailPostsBottomSheet({super.key});

  @override
  State<DetailPostsBottomSheet> createState() => _DetailPostsBottomSheetState();
}

class _DetailPostsBottomSheetState extends State<DetailPostsBottomSheet> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    controller.fetchDetailPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Detail Posts',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Obx(
            () => controller.detailPosts.value == null
                ? const Center(child: CircularProgressIndicator())
                : controller.detailLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'UserID : ${controller.detailPosts.value?.userId}'),
                          Text('Body : ${controller.detailPosts.value?.body}'),
                        ],
                      ),
          ),
        ),
      ],
    );
  }
}
