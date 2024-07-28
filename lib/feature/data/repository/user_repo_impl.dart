import 'package:test_my_feature/feature/data/data_source/user_remote_data_source.dart';
import 'package:test_my_feature/feature/domain/entity/user_entity.dart';
import 'package:test_my_feature/feature/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    return await remoteDataSource.fetchUsers();
  }
}
