import 'package:arctekko/domain/photo/photo.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/photo/dto/photo_data.dart';
import 'package:arctekko/presentation/photo/selectioned_photo.dart';
import 'package:get/get.dart';

class PhotoGridController extends GetxController {
  PhotoDomainService _photoDomainService;

  PhotoGridController(PhotoDomainService photoDomainService) {
    _photoDomainService = photoDomainService;
  }

  final _photoList = [].obs;

  final _selectedPhotoIndex = 0.obs;

  get photoList => _photoList.value;

  get selectedPhotoIndex => _selectedPhotoIndex.value;

  int get photoListLength => _photoList.value.length;

  set selectedPhoto(int index) => _selectedPhotoIndex.value = index;

  PhotoData getAt(int index) => _photoList.value[index];

  PhotoData getSelectionedPhoto() {
    return _photoList.value[_selectedPhotoIndex.value];
  }

  changeSelectedPhoto(int index) {
    _selectedPhotoIndex.value = index;
    Get.to(SelectionedPhotoScreen());
  }

  @override
  void onInit() async {
    _photoList.value = await this._photoDomainService.getPhotos();

    super.onInit();
  }
}
