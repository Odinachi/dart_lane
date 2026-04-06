import 'package:dartcoder/features/authentication/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    test('fromJson maps all fields', () {
      final m = UserModel.fromJson({
        'first_name': 'Ada',
        'last_name': 'Lovelace',
        'createdAt': '2024-01-15T12:00:00.000Z',
        'current_level': 'Level 1',
        'uid': 'uid-1',
        'email': 'ada@example.com',
      });
      expect(m.firstName, 'Ada');
      expect(m.lastName, 'Lovelace');
      expect(m.createdAt, DateTime.parse('2024-01-15T12:00:00.000Z'));
      expect(m.currentLevel, 'Level 1');
      expect(m.uid, 'uid-1');
      expect(m.email, 'ada@example.com');
    });

    test('fromJson treats missing createdAt as null', () {
      final m = UserModel.fromJson({
        'first_name': 'A',
        'last_name': 'B',
        'current_level': null,
        'uid': 'u',
        'email': 'e@e.com',
      });
      expect(m.createdAt, isNull);
    });

    test('toJson round-trips with fromJson', () {
      final original = UserModel(
        firstName: 'Sam',
        lastName: 'O',
        createdAt: DateTime.utc(2026, 4, 6, 10, 30),
        currentLevel: 'L2',
        uid: 'x',
        email: 'sam@example.com',
      );
      final restored = UserModel.fromJson(original.toJson());
      expect(restored.firstName, original.firstName);
      expect(restored.lastName, original.lastName);
      expect(restored.createdAt, original.createdAt);
      expect(restored.currentLevel, original.currentLevel);
      expect(restored.uid, original.uid);
      expect(restored.email, original.email);
    });
  });
}
