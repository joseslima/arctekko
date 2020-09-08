import 'package:arctekko/infrastructure/dal/services/user/dto/user_data.dart';
import 'package:arctekko/infrastructure/dal/services/user/user.service.dart';
import 'package:flutter/foundation.dart';

class UserDomainRepository {
  UserService _userService;

  UserDomainRepository({@required userService}) {
    _userService = userService;
  }

  Future<List<UserData>> getUsers() async {
    try {
      return await this._userService.geUsers();
    } catch (e) {
      throw e;
    }
  }

  Future<UserData> getUser(int id) async {
    try {
      return await this._userService.getUser(id.toString());
    } catch (e) {
      throw e;
    }
  }
}
