import 'package:arctekko/domain/post/post.domain.service.dart';
import 'package:arctekko/domain/user/user.domain.service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PostDomainService _postDomainService;
  UserDomainService _userDomainService;

  HomeController(
      {@required PostDomainService postDomainService,
      @required userDomainService}) {
    _postDomainService = postDomainService;
    _userDomainService = userDomainService;
  }

  @override
  void onInit() async {
    var a = await _postDomainService.getPosts();

    super.onInit();
  }

  final _test = 'beleza'.obs;

  String get test => _test.value;
}
