import 'package:dartcoder/features/authentication/models/user_progress.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserProgressModel', () {
    test('fromJson uses empty lists when collections are null', () {
      final m = UserProgressModel.fromJson({
        'current_course': 1,
        'passed_courses': null,
        'passed_dsa': null,
      });
      expect(m.currentCourse, 1);
      expect(m.passedCourses, isEmpty);
      expect(m.passedDsa, isEmpty);
    });

    test('fromJson maps list fields', () {
      final m = UserProgressModel.fromJson({
        'current_course': 2,
        'passed_courses': [1, 2],
        'passed_dsa': ['a', 'b'],
      });
      expect(m.currentCourse, 2);
      expect(m.passedCourses, [1, 2]);
      expect(m.passedDsa, ['a', 'b']);
    });

    test('copyWith overrides only provided fields', () {
      final base = UserProgressModel(
        currentCourse: 1,
        passedCourses: [1],
        passedDsa: ['x'],
      );
      final next = base.copyWith(currentCourse: 3);
      expect(next.currentCourse, 3);
      expect(next.passedCourses, [1]);
      expect(next.passedDsa, ['x']);
    });

    test('toJson round-trips with fromJson', () {
      final original = UserProgressModel(
        currentCourse: 5,
        passedCourses: [1, 2, 3],
        passedDsa: ['p1', 'p2'],
      );
      final restored = UserProgressModel.fromJson(original.toJson());
      expect(restored.currentCourse, original.currentCourse);
      expect(restored.passedCourses, original.passedCourses);
      expect(restored.passedDsa, original.passedDsa);
    });
  });
}
