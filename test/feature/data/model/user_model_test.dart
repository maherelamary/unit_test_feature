import 'package:flutter_test/flutter_test.dart';
import 'package:test_my_feature/feature/data/model/user_model.dart';
import 'package:test_my_feature/feature/domain/entity/user_entity.dart';

void main() {
  group('Test UserModel', () {
    // Test case for equality
    test(
        'Should consider two UserModel instances equal if they have the same attributes',
        () {
      // Arrange
      final userModelOne = UserModel(
        id: '1',
        name: 'Mazen',
        email: 'mazen@example.com',
        tCode: 'TC123',
      );
      final userModelTwo = UserModel(
        id: '1',
        name: 'Mazen',
        email: 'mazen@example.com',
        tCode: 'TC123',
      );

      // Act & Assert
      expect(userModelOne, equals(userModelTwo));
    });

    test(
        'Should consider two UserModel instances not equal if they have different attributes',
        () {
      // Arrange
      final userModelOne = UserModel(
        id: '1',
        name: 'Mazen',
        email: 'mazen@example.com',
        tCode: 'TC123',
      );
      final userModelTwo = UserModel(
        id: '1',
        name: 'Maged',
        email: 'Maged@example.com',
        tCode: 'TC123',
      );

      // Act & Assert
      expect(userModelOne, isNot(equals(userModelTwo)));
    });

    // Test case for fromJson
    test('Should create a UserModel instance from a JSON map', () {
      // Arrange
      final jsonMap = {
        'id': '1',
        'name': 'Mazen',
        'email': 'mazen@example.com',
        'tCode': 'TC123',
      };

      // Act
      final userModel = UserModel.fromJson(jsonMap);

      // Assert
      expect(userModel.id, '1');
      expect(userModel.name, 'Mazen');
      expect(userModel.email, 'mazen@example.com');
      expect(userModel.tCode, 'TC123');
    });

    test('Should be subclass from User Entity', () {
      // Arrange
      final userModel = UserModel(
        id: '1',
        name: 'Maged',
        email: 'Maged@example.com',
        tCode: 'TC123',
      );
      // Act

      // Assert
      expect(userModel, isA<User>());
    });
  });
}
