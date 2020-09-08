import 'package:arctekko/domain/post/post.domain.repository.dart';
import 'package:arctekko/domain/post/post.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/post/post.service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PostDomainBinding {
  PostDomainService _postDomainService;
  PostDomainService get domain => _postDomainService;

  PostDomainBinding() {
    Dio dio = Get.find();
    var postService = PostService(dio);
    var postDomainRepository =
        PostDomainRepository(postService: postService);
    _postDomainService =
        PostDomainService(postDomainRepository = postDomainRepository);
  }
}
