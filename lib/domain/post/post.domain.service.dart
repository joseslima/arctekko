import 'package:arctekko/domain/photo/photo.domain.respository.dart';
import 'package:arctekko/domain/post/post.domain.repository.dart';
import 'package:arctekko/infrastructure/dal/services/photo/dto/photo_data.dart';
import 'package:arctekko/infrastructure/dal/services/post/dto/post_data.dart';

class PostDomainService {
  PostDomainRepository _postDomainRepository;

  PostDomainService(PostDomainRepository postDomainRepository) {
    _postDomainRepository = postDomainRepository;
  }

  Future<List<PostData>> getPosts() async {
    try {
      return _postDomainRepository.getPosts();
    } catch (e) {
      throw e;
    }
  }
}
