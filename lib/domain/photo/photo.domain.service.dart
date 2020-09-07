import 'package:arctekko/domain/photo/photo.domain.respository.dart';
import 'package:arctekko/infrastructure/dal/services/photo/dto/get_photos.response.dart';

class PhotoDomainService {
  PhotoDomainRepository _photoDomainRepository;

  PhotoDomainService(PhotoDomainRepository photoDomainRepository) {
    _photoDomainRepository = photoDomainRepository;
  }

  Future<List<PhotoData>> getPhotos() async {
    try {
      return await _photoDomainRepository.getPhotos();
    } catch (e) {
      throw e;
    }
  }
}
