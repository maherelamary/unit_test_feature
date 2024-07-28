import 'package:flutter_test/flutter_test.dart';
import 'package:test_my_feature/feature/data/data_source/user_remote_data_source.dart';
import 'package:test_my_feature/feature/data/model/user_model.dart';

void main() {
  test('Should fetchUsers returns list of UserModel', () async {
    // Arrange
    final UserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();
    // Act
    final result = await userRemoteDataSource.fetchUsers();

    // Assert
    expect(result, isA<List<UserModel>>());
  });
}
