import 'package:arctekko/domain/post/models/post.model.dart';
import 'package:arctekko/domain/post/post.domain.service.dart';
import 'package:arctekko/domain/user/user.domain.service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  PostDomainService _postDomainService;
  UserDomainService _userDomainService;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  HomeController(
      {@required PostDomainService postDomainService,
      @required userDomainService}) {
    _postDomainService = postDomainService;
    _userDomainService = userDomainService;
  }

  @override
  void onInit() async {
    _posts.value = await _postDomainService.getPosts();
    _initialLoading.value = false;
    super.onInit();
  }

  getPosts() async {
    _posts.value = await _postDomainService.getPosts();
    _refreshController.refreshCompleted();
  }

  final _posts = List<Post>().obs;

  final _initialLoading = true.obs;

  List<Post> get posts => _posts.value;

  int get postsLength => _posts.value.length;

  RefreshController get refreshController => _refreshController;

  bool get initialLoading => _initialLoading.value;

  Post getPostAt(int index) {
    return posts[index];
  }
}
