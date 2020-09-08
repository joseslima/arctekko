import 'package:arctekko/infrastructure/dal/services/photo/dto/photo_data.dart';
import 'package:arctekko/infrastructure/dal/services/photo/photo.service.dart';
import 'package:flutter/foundation.dart';

class PhotoDomainRepository {
  PhotoService _photoService;

  PhotoDomainRepository({@required photoService}) {
    _photoService = photoService;
  }

  Future<List<PhotoData>> getPhotos() async {
    try {
      return await this._photoService.getPhotos();
    } catch (e) {
      throw e;
    }
  }
}
