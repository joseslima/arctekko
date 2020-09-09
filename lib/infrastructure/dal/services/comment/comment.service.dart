import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/comment_data.dart';

part 'comment.service.g.dart';


@RestApi()
abstract class CommentService {
  factory CommentService(Dio dio) = _CommentService;

  @GET('/comments')
  Future<List<CommentData>> getComments(
    @Query("postId") String postId,
  );
}