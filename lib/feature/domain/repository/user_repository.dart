import 'package:test_my_feature/feature/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
