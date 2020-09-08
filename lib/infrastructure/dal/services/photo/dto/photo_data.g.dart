// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoData _$PhotoDataFromJson(Map<String, dynamic> json) {
  return PhotoData(
    id: json['id'] as int,
    albumId: json['albumId'] as int,
    title: json['title'] as String,
    url: json['url'] as String,
    thumbnailUrl: json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$PhotoDataToJson(PhotoData instance) => <String, dynamic>{
      'id': instance.id,
      'albumId': instance.albumId,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
