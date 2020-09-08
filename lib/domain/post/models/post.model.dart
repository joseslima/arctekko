import 'package:arctekko/domain/user/models/user.model.dart';
import 'package:arctekko/infrastructure/dal/services/post/dto/post_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.model.g.dart';

@JsonSerializable()
class Post {
  int id;
  String title;
  String body;
  User user;

  Post({this.id, this.user, this.title, this.body});

  factory Post.fromPostData(PostData postData) {
    return Post(
      id: postData.id,
      body: postData.body,
      title: postData.title,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
