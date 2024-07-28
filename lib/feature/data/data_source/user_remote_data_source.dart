import 'package:test_my_feature/feature/data/model/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> fetchUsers();
}

class UserRemoteDataSource implements UserDataSource {
  @override
  Future<List<UserModel>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      UserModel(
        id: '1',
        name: 'John',
        email: 'john@google.com',
        tCode: 'id955686',
      ),
      UserModel(
        id: '2',
        name: 'Smith',
        email: 'smith@yahoo.com',
        tCode: 'id344321',
      ),
    ];
  }
}
