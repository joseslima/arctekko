import 'package:arctekko/domain/comment/comment.domain.service.dart';
import 'package:arctekko/domain/comment/models/comment.model.dart';
import 'package:arctekko/domain/post/models/post.model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  CommentDomainService _commentDomainService;

  CommentController({
    @required CommentDomainService comentDomainService,
  }) {
    _commentDomainService = comentDomainService;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  getCommentsWherePostId(int postId) async {
    if (!_loadComments.value) {
      _comments.value =
          await _commentDomainService.getCommentsWherePostId(postId);
      _loadComments.value = true;
      print(_comments.value);
    }
  }

  final _loadComments = false.obs;

  final _comments = List<Comment>().obs;

  final _teste = 'opa'.obs;

  List<Comment> get comments => _comments.value;

  bool get loadComments => _loadComments.value;

  int get commentsListLength => _comments.value.length;

  String get teste => _teste.value;
}
