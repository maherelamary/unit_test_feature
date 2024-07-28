// Create the User Repository provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_my_feature/feature/data/data_source/user_remote_data_source.dart';
import 'package:test_my_feature/feature/data/repository/user_repo_impl.dart';
import 'package:test_my_feature/feature/domain/entity/user_entity.dart';
import 'package:test_my_feature/feature/domain/repository/user_repository.dart';
import 'package:test_my_feature/feature/domain/usecase/get_users_usecase.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(UserRemoteDataSource());
});

// Create the Get Users use case provider
final getUsersProvider = Provider<GetUsersUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return GetUsersUseCase(repository);
});

// Create the User StateNotifier provider
final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<List<User>>>((ref) {
  final getUsers = ref.watch(getUsersProvider);
  return UserNotifier(getUsers);
});

class UserNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final GetUsersUseCase getUsersUseCase;

  UserNotifier(this.getUsersUseCase) : super(const AsyncValue.loading());

  Future<void> fetchUsers() async {
    try {
      final users = await getUsersUseCase();
      state = AsyncValue.data(users);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString(e.toString()));
    }
  }
}
