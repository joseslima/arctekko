import 'package:arctekko/domain/user/models/user.model.dart';
import 'package:arctekko/infrastructure/dal/services/comment/dto/comment_data.dart';
import 'package:arctekko/infrastructure/dal/services/post/dto/post_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.model.g.dart';

@JsonSerializable()
class Comment {
  int id;
  String name;
  String email;
  String body;

  Comment({this.id, this.name, this.email, this.body});

  factory Comment.fromPostData(CommentData commentData) {
    return Comment(
      id: commentData.id,
      body: commentData.body,
      email: commentData.email,
      name: commentData.name
    );
  }

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
