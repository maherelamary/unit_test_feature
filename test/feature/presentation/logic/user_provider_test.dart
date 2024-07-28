import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_my_feature/feature/domain/entity/user_entity.dart';
import 'package:test_my_feature/feature/domain/usecase/get_users_usecase.dart';
import 'package:test_my_feature/feature/presentation/logic/user_provider.dart';

class MockGetUsersUseCase extends Mock implements GetUsersUseCase {}

void main() {
  group('Test UserNotifier', () {
    late MockGetUsersUseCase mockGetUsersUseCase;
    late ProviderContainer container;
    late UserNotifier userNotifier;

    setUp(() {
      mockGetUsersUseCase = MockGetUsersUseCase();
      container = ProviderContainer(
        overrides: [
          getUsersProvider.overrideWithValue(mockGetUsersUseCase),
        ],
      );
      userNotifier = container.read(userProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('Should initial state with loading', () {
      //assert
      expect(userNotifier.state, const AsyncValue<List<User>>.loading());
    });

    test('fetchUsers should set state to data on successful fetch', () async {
      final tResult = [
        User(id: "023421", name: 'Maher', email: 'maher@alamary.com')
      ];

      //arrange
      when(() => mockGetUsersUseCase()).thenAnswer((_) async => tResult);

      //act
      await userNotifier.fetchUsers();

      //assert
      expect(userNotifier.state, AsyncValue.data(tResult));
    });

    test('fetchUsers should set state to error on failure', () async {
      final exception = Exception('Fetch failed');
      //arrange
      when(() => mockGetUsersUseCase()).thenThrow(exception);

      //act
      await userNotifier.fetchUsers();
      //assert
      expect(userNotifier.state, isA<AsyncError>());
    });
  });
}
