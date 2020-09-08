import 'package:arctekko/infrastructure/dal/services/comment/comment.service.dart';
import 'package:arctekko/infrastructure/dal/services/comment/dto/comment_data.dart';
import 'package:flutter/foundation.dart';

class CommentDomainRepository {
  CommentService _commentService;

  CommentDomainRepository({@required commentService}) {
    _commentService = commentService;
  }

  Future<List<CommentData>> getComments() async {
    try {
      return await this._commentService.getComments();
    } catch (e) {
      throw e;
    }
  }
}
