import 'package:flutter_test/flutter_test.dart';
import 'package:test_my_feature/feature/domain/entity/user_entity.dart';

void main() {
  group('User', () {
    // Test case for equality
    test(
        'Should consider two User instances equal if they have the same attributes',
        () {
      // Arrange
      final userOne = User(id: '1', name: 'Mazen', email: 'mazen@example.com');
      final userTwo = User(id: '1', name: 'Mazen', email: 'mazen@example.com');

      // Act & Assert
      expect(userOne, equals(userTwo));
    });

    test(
        'should consider two User instances not equal if they have different attributes',
        () {
      // Arrange
      final userOne = User(id: '1', name: 'Mazen', email: 'mazen@example.com');
      final userTwo = User(id: '2', name: 'Ahmed', email: 'ahmed@example.com');

      // Act & Assert
      expect(userOne, isNot(equals(userTwo)));
    });
  });
}
