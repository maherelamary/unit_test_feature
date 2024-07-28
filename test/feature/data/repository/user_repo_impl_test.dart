import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_my_feature/feature/data/data_source/user_remote_data_source.dart';
import 'package:test_my_feature/feature/data/model/user_model.dart';
import 'package:test_my_feature/feature/data/repository/user_repo_impl.dart';

class MockUserRemoteDataSource extends Mock implements UserDataSource {}

void main() {
  group('Test User Repository', () {
    late MockUserRemoteDataSource userRemoteDataSource =
        MockUserRemoteDataSource();
    late UserRepositoryImpl sut;
    setUp(() {
      userRemoteDataSource = MockUserRemoteDataSource();
      sut = UserRepositoryImpl(userRemoteDataSource);
    });
    test('Should returns users list when getUsers called', () async {
      final tResult = [
        UserModel(
            id: "33434",
            name: "Maher",
            email: "maher@gmail.com",
            tCode: "#213123")
      ];
      //arrange

      when(() => userRemoteDataSource.fetchUsers())
          .thenAnswer((_) async => tResult);

      //act
      final result = await sut.getUsers();

      //assert
      verify(userRemoteDataSource.fetchUsers);
      expect(result, tResult);
    });

    test('Should throw an exception when fetchUsers fails', () async {
      // Arrange
      final tException = Exception('Fetch failed');
      when(() => userRemoteDataSource.fetchUsers()).thenThrow(tException);

      // Act
      final call = sut.getUsers;

      // Assert
      expect(call, throwsA(tException));
    });
  });
}
