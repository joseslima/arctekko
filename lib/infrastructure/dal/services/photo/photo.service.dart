import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/photo_data.dart';

part 'photo.service.g.dart';

@RestApi()
abstract class PhotoService {
  factory PhotoService(Dio dio) = _PhotoService;

  @GET('/photos')
  Future<List<PhotoData>> getPhotos();
}
