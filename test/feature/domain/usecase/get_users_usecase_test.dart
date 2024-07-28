import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_my_feature/feature/data/repository/user_repo_impl.dart';
import 'package:test_my_feature/feature/domain/entity/user_entity.dart';
import 'package:test_my_feature/feature/domain/usecase/get_users_usecase.dart';

class MockUserRepositoryImpl extends Mock implements UserRepositoryImpl {}

void main() {
  final tResult = [
    User(id: '35435', name: "Maher", email: "maher@google.com"),
    User(id: '3455', name: "Nader", email: "nader@google.com"),
  ];
  test('Should returns list of users when getUsersUseCase called', () async {
    //arrange
    final MockUserRepositoryImpl repository = MockUserRepositoryImpl();
    final GetUsersUseCase sut = GetUsersUseCase(repository);

    when(() => repository.getUsers()).thenAnswer((_) async => tResult);
    //act

    final result = await sut();
    //assert
    verify(repository.getUsers);
    verifyNoMoreInteractions(repository);
    expect(result, tResult);
  });

  test('should throw an error when getUsersUseCase called with an exception',
      () async {
    //arrange
    final MockUserRepositoryImpl repository = MockUserRepositoryImpl();
    final GetUsersUseCase sut = GetUsersUseCase(repository);
    final exp = Exception('error occurred');

    when(() => repository.getUsers()).thenThrow(exp);
    //act
    final call = sut.call;

    //assert
    expect(call, throwsA(isA<Exception>()));
  });
}
