import 'package:arctekko/infrastructure/navigation/bindings/domains/post.domain.binding.dart';
import 'package:arctekko/infrastructure/navigation/bindings/domains/user.domain.binding.dart';
import 'package:arctekko/presentation/home/controller/home.controller.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    var userBinding = UserDomainBinding();
    var postBinding = PostDomainBinding();
    Get.lazyPut<HomeController>(() => HomeController(
        postDomainService: postBinding.domain,
        userDomainService: userBinding.domain));
  }
}
