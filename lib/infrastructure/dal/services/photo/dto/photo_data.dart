import 'package:json_annotation/json_annotation.dart';

part 'photo_data.g.dart';


@JsonSerializable()
class PhotoData {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  PhotoData({this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  factory PhotoData.fromJson(Map<String, dynamic> json) =>
      _$PhotoDataFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDataToJson(this);
}
