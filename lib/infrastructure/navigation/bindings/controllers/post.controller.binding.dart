import 'package:arctekko/infrastructure/navigation/bindings/domains/comment.domain.binding.dart';
import 'package:arctekko/infrastructure/navigation/bindings/domains/post.domain.binding.dart';
import 'package:arctekko/presentation/home/controller/home.controller.dart';
import 'package:arctekko/presentation/post/controllers/comment.controller.dart';
import 'package:get/get.dart';

class PostControllerBinding extends Bindings {
  @override
  void dependencies() {
    var commentBinding = CommentDomainBinding();
    Get.lazyPut<CommentController>(
        () => CommentController(comentDomainService: commentBinding.domain));
  }
}
