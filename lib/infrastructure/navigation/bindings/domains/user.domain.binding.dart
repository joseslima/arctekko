import 'package:arctekko/domain/user/user.domain.repository.dart';
import 'package:arctekko/domain/user/user.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/user/user.service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserDomainBinding {
  UserDomainService _userDomainService;
  UserDomainService get domain => _userDomainService;

  UserDomainBinding() {
    Dio dio = Get.find();
    var userService = UserService(dio);
    var userDomainRepository = UserDomainRepository(userService: userService);
    _userDomainService =
        UserDomainService(userDomainRepository = userDomainRepository);
  }
}
