import 'package:dartcoder/features/editor/models/dsa_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DsaListModel', () {
    test('fromJson maps fields and optional id', () {
      final m = DsaListModel.fromJson(
        {
          'problem_name': 'Two Sum',
          'difficulty': 'easy',
          'description': 'Find pair',
        },
        id: 'doc-1',
      );
      expect(m.problemName, 'Two Sum');
      expect(m.difficulty, 'easy');
      expect(m.description, 'Find pair');
      expect(m.id, 'doc-1');
    });

    test('toJson round-trips with fromJson', () {
      final original = DsaListModel(
        problemName: 'Binary Search',
        difficulty: 'medium',
        description: 'Sorted array',
        id: 'ignored-in-json',
      );
      final json = original.toJson();
      final restored = DsaListModel.fromJson(json, id: 'ignored-in-json');
      expect(restored.problemName, original.problemName);
      expect(restored.difficulty, original.difficulty);
      expect(restored.description, original.description);
      expect(restored.id, 'ignored-in-json');
    });
  });
}
