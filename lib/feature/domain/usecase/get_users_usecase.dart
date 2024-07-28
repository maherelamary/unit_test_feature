import 'package:test_my_feature/feature/domain/entity/user_entity.dart';
import 'package:test_my_feature/feature/domain/repository/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<User>> call() async {
    return await repository.getUsers();
  }
}
