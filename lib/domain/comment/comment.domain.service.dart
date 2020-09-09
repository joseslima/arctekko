import 'package:arctekko/domain/comment/comment.domain.repository.dart';
import 'package:arctekko/domain/comment/models/comment.model.dart';
import 'package:arctekko/domain/user/user.domain.repository.dart';
import 'package:arctekko/infrastructure/dal/services/comment/dto/comment_data.dart';
import 'package:arctekko/infrastructure/dal/services/user/dto/user_data.dart';

class CommentDomainService {
  CommentDomainRepository _commentDomainRepository;

  CommentDomainService(CommentDomainRepository commentDomainRepository) {
    _commentDomainRepository = commentDomainRepository;
  }

  Future<List<Comment>> getCommentsWherePostId(int postId) async {
    try {
      return _commentDomainRepository.getCommentsWherePostId(postId);
    } catch (e) {
      throw e;
    }
  }
}
