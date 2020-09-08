import 'package:arctekko/domain/post/post.domain.repository.dart';
import 'package:arctekko/domain/post/post.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/post/post.service.dart';
import 'package:arctekko/infrastructure/dal/services/user/user.service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PostDomainBinding {
  PostDomainService _postDomainService;
  PostDomainService get domain => _postDomainService;

  PostDomainBinding() {
    Dio dio = Get.find();
    var postService = PostService(dio);
    var userService = UserService(dio);

    var postDomainRepository = PostDomainRepository(
        postService: postService, userService: userService);
    _postDomainService =
        PostDomainService(postDomainRepository = postDomainRepository);
  }
}
