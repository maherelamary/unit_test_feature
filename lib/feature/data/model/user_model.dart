import 'package:equatable/equatable.dart';
import 'package:test_my_feature/feature/domain/entity/user_entity.dart';

class UserModel extends User with EquatableMixin {
  final String id;
  final String name;
  final String email;
  final String tCode;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.tCode})
      : super(id: id, name: name, email: email);

  /*
  fromJson factory method has no thing to do logically with the app but
  for demonstration purposes and keep it different from our app entity
  */
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      tCode: map["tCode"],
    );
  }

  @override
  List<Object?> get props => [id, name, email, tCode];
}
