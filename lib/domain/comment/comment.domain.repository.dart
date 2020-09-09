import 'package:arctekko/domain/comment/models/comment.model.dart';
import 'package:arctekko/infrastructure/dal/services/comment/comment.service.dart';
import 'package:arctekko/infrastructure/dal/services/comment/dto/comment_data.dart';
import 'package:flutter/foundation.dart';

class CommentDomainRepository {
  CommentService _commentService;

  CommentDomainRepository({@required commentService}) {
    _commentService = commentService;
  }

  Future<List<Comment>> getCommentsWherePostId(int postId) async {
    try {
      var commentDataList = await this._commentService.getComments(postId.toString());

      var commentList =
          await Future.wait(commentDataList.map((commentData) async {
        return Comment.fromPostData(commentData);
      }));

      return commentList;
    } catch (e) {
      throw e;
    }
  }
}
