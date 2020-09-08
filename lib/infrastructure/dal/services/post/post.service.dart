import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/post_data.dart';

part 'post.service.g.dart';

@RestApi()
abstract class PostService {
  factory PostService(Dio dio) = _PostService;

  @GET('/posts')
  Future<List<PostData>> gePosts();

  @GET("/posts/{id}")
  Future<PostData> getTask(@Path("id") String id);
}