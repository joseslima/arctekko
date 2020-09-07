import 'package:arctekko/infrastructure/navigation/bindings/domains/photo.domain.binding.dart';
import 'package:get/get.dart';
import 'package:arctekko/presentation/photo/controllers/photo_grid.controller.dart';

class PhotoGridControllerBinding extends Bindings {
  @override
  void dependencies() {
    var domainBinding = PhotoDomainBinding();
    Get.lazyPut<PhotoGridController>(
        () => PhotoGridController(domainBinding.domain));
  }
}
