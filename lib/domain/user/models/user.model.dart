import 'package:arctekko/infrastructure/dal/services/user/dto/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String phone;
  String website;

  User({this.id, this.name, this.email, this.phone, this.website});

  factory User.fromUserData(UserData userData) {
    return User(
      id: userData.id,
      email: userData.email,
      name: userData.name,
      phone: userData.phone,
      website: userData.website
    );
  }

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
