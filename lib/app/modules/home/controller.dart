import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_posts/app/data/models/posts.dart';
import 'package:getx_posts/app/data/providers/posts_provider.dart';

class HomeController extends GetxController {
  final PostsProvider postsProvider;

  HomeController({required this.postsProvider});

  var isLoading = false.obs;
  var detailLoading = false.obs;
  var posts = <Posts>[].obs;
  var detailPosts = Rx<Posts?>(null);
  final id = 0.obs;

  @override
  void onInit() {
    fetchPosts();
    if (id.value != 0) {
      fetchDetailPosts();
    }
    super.onInit();
  }

  @override
  void onReady() {
    fetchPosts();
    if (id.value != 0) {
      fetchDetailPosts();
    }
    super.onReady();
  }

  @override
  void onClose() {
    posts.clear();
    super.onClose();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;

    try {
      final response = await postsProvider.fetchPosts();
      final List<Posts> body = response.data == null
          ? []
          : listPostsFromJson(jsonEncode(response.data));

      posts.value = body;
    } on DioException catch (e) {
      Get.snackbar(
        'Fetching Failed',
        e.response.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> fetchDetailPosts() async {
    detailLoading.value = true;

    try {
      final response = await postsProvider.fetchDetailPosts(id.value);
      detailPosts.value = postsFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      Get.snackbar(
        'Fetching Failed',
        e.response.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      detailLoading.value = false;
      update();
    }
  }

  Future<void> refreshPosts() async {
    fetchPosts();
  }
}
