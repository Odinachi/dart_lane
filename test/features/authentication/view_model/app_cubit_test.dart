import 'package:bloc_test/bloc_test.dart';
import 'package:dartcoder/features/authentication/models/user_model.dart';
import 'package:dartcoder/features/authentication/models/user_progress.dart';
import 'package:dartcoder/features/authentication/view_model/app_cubit.dart';
import 'package:dartcoder/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseServices extends Mock implements FirebaseServices {}

class MockUserCredential extends Mock implements UserCredential {}

class FakeUserModel extends Fake implements UserModel {}

class FakeUserProgressModel extends Fake implements UserProgressModel {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppCubit appCubit;
  late MockFirebaseServices mockFirebaseServices;
  late MockUserCredential mockUserCredential;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;

  setUpAll(() {
    registerFallbackValue(FakeUserModel());
    registerFallbackValue(FakeUserProgressModel());
  });

  setUp(() {
    mockFirebaseServices = MockFirebaseServices();
    mockUserCredential = MockUserCredential();
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();

    when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

    when(() => mockUser.uid).thenReturn('test-uid-123');
    when(() => mockUser.email).thenReturn('test@example.com');
    when(() => mockUser.displayName).thenReturn('Test User');

    appCubit = AppCubit(
      firebaseAuth: mockFirebaseAuth,
      firebaseServices: mockFirebaseServices,
    );
  });

  tearDown(() {
    appCubit.close();
  });

  group('AppCubit', () {
    // signIn success
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthSuccessful, AuthLoading, AuthProfileCreated] when Google sign-in succeeds and profile is created',
      build: () {
        when(() => mockFirebaseServices.signInWithGoogle()).thenAnswer(
          (_) async => (
            account: mockUserCredential,
            givenName: 'Samuel',
            familyName: 'Ogundoju',
            error: null,
          ),
        );
        when(() => mockFirebaseServices.saveProfile(any()))
            .thenAnswer((_) async => (success: true, error: null));
        when(() => mockFirebaseServices.getProfile()).thenAnswer(
          (_) async =>
              (user: UserModel(uid: '123', firstName: 'Samuel'), error: null),
        );
        return appCubit;
      },
      act: (cubit) => cubit.signIn(true),
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthSuccessful>(),
        isA<AuthLoading>(),
        isA<AuthProfileCreated>(),
      ],
    );

    // signIn error
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthError] when sign-in fails',
      build: () {
        when(() => mockFirebaseServices.signInWithGoogle()).thenAnswer(
          (_) async => (
            account: null,
            givenName: null,
            familyName: null,
            error: 'Failed'
          ),
        );
        return appCubit;
      },
      act: (cubit) => cubit.signIn(true),
      expect: () => [isA<AuthLoading>(), isA<AuthError>()],
    );

    // signOut
    blocTest<AppCubit, AppState>(
      'emits [AuthLogout] when signOut is called',
      build: () {
        when(() => mockFirebaseServices.signOut()).thenAnswer((_) async {});
        return appCubit;
      },
      act: (cubit) => cubit.signOut(),
      expect: () => [isA<AuthLogout>()],
    );

    // getUserProfile with profile existing
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthProfileExists] when profile exists',
      build: () {
        when(() => mockFirebaseServices.getProfile()).thenAnswer(
          (_) async => (
            user: UserModel(
                uid: '123', firstName: 'Samuel', currentLevel: 'Level 1'),
            error: null
          ),
        );
        when(() => mockFirebaseServices.getUserProgress()).thenAnswer(
          (_) async => (
            progress: UserProgressModel(currentCourse: 1, passedCourses: [1]),
            error: null
          ),
        );
        // ✅ Use the mocked firebaseAuth instance instead of FirebaseAuth.instance
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        return appCubit;
      },
      act: (cubit) => cubit.getUserProfile(),
      expect: () => [isA<AuthLoading>(), isA<AuthProfileExists>()],
    );

    // getUserProfile with profile missing
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthProfileMissing] when profile is missing',
      build: () {
        when(() => mockFirebaseServices.getProfile()).thenAnswer(
          (_) async =>
              (user: UserModel(uid: '123', firstName: 'Samuel'), error: null),
        );
        // ✅ Use the mocked firebaseAuth instance
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        return appCubit;
      },
      act: (cubit) => cubit.getUserProfile(),
      expect: () => [isA<AuthLoading>(), isA<AuthProfileMissing>()],
    );

    // deleteAccount success
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthLogout] when account deletion succeeds',
      build: () {
        when(() => mockFirebaseServices.deleteAccount())
            .thenAnswer((_) async => (deleted: true, error: null));
        return appCubit;
      },
      act: (cubit) => cubit.deleteAccount(),
      expect: () => [isA<AuthLoading>(), isA<AuthLogout>()],
    );

    // deleteAccount failure
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthError] when account deletion fails',
      build: () {
        when(() => mockFirebaseServices.deleteAccount())
            .thenAnswer((_) async => (deleted: false, error: 'Delete failed'));
        return appCubit;
      },
      act: (cubit) => cubit.deleteAccount(),
      expect: () => [isA<AuthLoading>(), isA<AuthError>()],
    );

    // createProfile success
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthProfileCreated] when createProfile succeeds',
      build: () {
        when(() => mockFirebaseServices.saveProfile(any()))
            .thenAnswer((_) async => (success: true, error: null));
        when(() => mockFirebaseServices.getProfile()).thenAnswer(
          (_) async =>
              (user: UserModel(uid: '123', firstName: 'Samuel'), error: null),
        );
        return appCubit;
      },
      act: (cubit) =>
          cubit.createProfile(firstName: 'Samuel', lastName: 'Ogundoju'),
      expect: () => [isA<AuthLoading>(), isA<AuthProfileCreated>()],
    );

    // createProfile failure
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthError] when createProfile fails',
      build: () {
        when(() => mockFirebaseServices.saveProfile(any()))
            .thenAnswer((_) async => (success: false, error: 'Failed'));
        return appCubit;
      },
      act: (cubit) => cubit.createProfile(firstName: 'John', lastName: 'Doe'),
      expect: () => [isA<AuthLoading>(), isA<AuthError>()],
    );

    // updatePassedCourses
    blocTest<AppCubit, AppState>(
      'emits [AuthInitial] when updatePassedCourses is called',
      build: () {
        when(() => mockFirebaseServices.updatePassedCourses(any()))
            .thenAnswer((_) async {});
        // ✅ Use the mocked firebaseAuth instance
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        return appCubit;
      },
      act: (cubit) => cubit.updatePassedCourses(1),
      expect: () => [isA<AuthInitial>()],
    );

    // updateCurrentCourse
    blocTest<AppCubit, AppState>(
      'emits [AuthInitial] when updateCurrentCourse is called',
      build: () {
        when(() => mockFirebaseServices.updateCurrentCourse(any()))
            .thenAnswer((_) async {});
        // ✅ Use the mocked firebaseAuth instance
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        return appCubit;
      },
      act: (cubit) => cubit.updateCurrentCourse(2),
      expect: () => [isA<AuthInitial>()],
    );

    // markProblemAsSolved
    blocTest<AppCubit, AppState>(
      'emits [AppUpdateProgress] when markProblemAsSolved is called',
      build: () {
        when(() => mockFirebaseServices.markProblemAsSolved(any()))
            .thenAnswer((_) async {});
        appCubit.userProgress = UserProgressModel(passedDsa: []);
        return appCubit;
      },
      act: (cubit) => cubit.markProblemAsSolved('problem_1'),
      expect: () => [isA<AppUpdateProgress>()],
    );
  });
}
