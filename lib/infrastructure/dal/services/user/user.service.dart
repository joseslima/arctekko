import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/user_data.dart';

part 'user.service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @GET('/users')
  Future<List<UserData>> getUsers();

  @GET("/users/{id}")
  Future<UserData> getUser(@Path("id") String id);
}
