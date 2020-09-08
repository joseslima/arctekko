import 'package:arctekko/domain/user/user.domain.repository.dart';
import 'package:arctekko/infrastructure/dal/services/user/dto/user_data.dart';

class UserDomainService {
  UserDomainRepository _userDomainRepository;

  UserDomainService(UserDomainRepository userDomainRepository) {
    _userDomainRepository = userDomainRepository;
  }

  Future<List<UserData>> getUsers() async {
    try {
      return _userDomainRepository.getUsers();
    } catch (e) {
      throw e;
    }
  }

  Future<UserData> getUser(int id) async {
    try {
      return await this._userDomainRepository.getUser(id);
    } catch (e) {
      throw e;
    }
  }
}
