import 'package:arctekko/domain/comment/comment.domain.repository.dart';
import 'package:arctekko/domain/comment/comment.domain.service.dart';
import 'package:arctekko/domain/user/user.domain.repository.dart';
import 'package:arctekko/domain/user/user.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/comment/comment.service.dart';
import 'package:arctekko/infrastructure/dal/services/user/user.service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CommentDomainBinding {
  CommentDomainService _commentDomainService;
  CommentDomainService get domain => _commentDomainService;

  CommentDomainBinding() {
    Dio dio = Get.find();
    var commentService = CommentService(dio);
    var commentDomainRepository =
        CommentDomainRepository(commentService: commentService);
    _commentDomainService =
        CommentDomainService(commentDomainRepository = commentDomainRepository);
  }
}
