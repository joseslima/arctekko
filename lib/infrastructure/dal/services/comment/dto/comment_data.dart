import 'package:json_annotation/json_annotation.dart';

part 'comment_data.g.dart';

@JsonSerializable()
class CommentData {
  int id;
  int postId;
  String name;
  String email;
  String body;

  CommentData({this.id, this.email, this.name, this.body, this.postId});

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDataToJson(this);
}
