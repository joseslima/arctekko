import 'package:arctekko/domain/photo/photo.domain.respository.dart';
import 'package:arctekko/domain/post/post.domain.repository.dart';
import 'package:arctekko/infrastructure/dal/services/photo/dto/photo_data.dart';
import 'package:arctekko/infrastructure/dal/services/post/dto/post_data.dart';

import 'models/post.model.dart';

class PostDomainService {
  PostDomainRepository _postDomainRepository;

  PostDomainService(PostDomainRepository postDomainRepository) {
    _postDomainRepository = postDomainRepository;
  }

  Future<List<Post>> getPosts() async {
    try {
      return await _postDomainRepository.getPosts();
    } catch (e) {
      throw e;
    }
  }
}
