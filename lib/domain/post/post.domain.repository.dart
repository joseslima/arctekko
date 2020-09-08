import 'package:arctekko/infrastructure/dal/services/post/dto/post_data.dart';
import 'package:arctekko/infrastructure/dal/services/post/post.service.dart';
import 'package:flutter/foundation.dart';

class PostDomainRepository {
  PostService _postService;

  PostDomainRepository({@required postService}) {
    _postService = _postService;
  }

  Future<List<PostData>> getPosts() async {
    try {
      return await this._postService.gePosts();
    } catch (e) {
      throw e;
    }
  }
}
