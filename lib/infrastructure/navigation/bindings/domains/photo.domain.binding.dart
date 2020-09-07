import 'package:arctekko/domain/photo/photo.domain.respository.dart';
import 'package:arctekko/domain/photo/photo.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/photo/photo.service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PhotoDomainBinding {
  PhotoDomainService _photoDomainService;
  PhotoDomainService get domain => _photoDomainService;

  PhotoDomainBinding() {
    Dio dio = Get.find();
    var photoService = PhotoService(dio);
    var photoDomainRepository =
        PhotoDomainRepository(photoService: photoService);
    _photoDomainService =
        PhotoDomainService(photoDomainRepository = photoDomainRepository);
  }
}
