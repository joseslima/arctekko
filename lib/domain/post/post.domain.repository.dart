import 'package:arctekko/domain/post/models/post.model.dart';
import 'package:arctekko/domain/user/models/user.model.dart';
import 'package:arctekko/infrastructure/dal/services/post/dto/post_data.dart';
import 'package:arctekko/infrastructure/dal/services/post/post.service.dart';
import 'package:arctekko/infrastructure/dal/services/user/dto/user_data.dart';
import 'package:arctekko/infrastructure/dal/services/user/user.service.dart';
import 'package:flutter/foundation.dart';

class PostDomainRepository {
  PostService _postService;
  UserService _userService;

  PostDomainRepository({@required postService, @required userService}) {
    _postService = postService;
    _userService = userService;
  }

  Future<List<Post>> getPosts() async {
    var userDataMap = Map<int, UserData>();
    try {
      var postDataList = await this._postService.gePosts();

      return await Future.wait(postDataList.map((postData) async {
        var userId = postData.userId;
        if (!userDataMap.containsKey(userId)) {
          var userData = await _userService.getUser(userId.toString());
          userDataMap[userId] = userData;
        }
        var user = User.fromUserData(userDataMap[userId]);

        var post = Post.fromPostData(postData);

        post.user = user;

        return post;
      }));
    } catch (e) {
      throw e;
    }
  }

  Future<UserData> _getUser() async {}
}
