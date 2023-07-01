import 'package:dio/dio.dart';
import 'package:getx_posts/app/core/utils/api_url.dart';

class PostsProvider {
  final dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));

  Future<Response> fetchPosts() async {
    return await dio.get(EndPoint.posts);
  }

  Future<Response> fetchDetailPosts(id) async {
    return await dio.get('${EndPoint.posts}/$id');
  }
}