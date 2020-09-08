// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CommentService implements CommentService {
  _CommentService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  getComments() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/comments',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CommentData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
