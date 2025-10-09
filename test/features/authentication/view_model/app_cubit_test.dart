import 'package:bloc_test/bloc_test.dart';
import 'package:dartcoder/features/authentication/models/user_model.dart';
import 'package:dartcoder/features/authentication/view_model/app_cubit.dart';
import 'package:dartcoder/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseServices extends Mock implements FirebaseServices {}

class MockUserCredential extends Mock implements UserCredential {}

class FakeUserModel extends Fake implements UserModel {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUserModel());
  });

  late AppCubit appCubit;
  late MockFirebaseServices mockFirebaseServices;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockFirebaseServices = MockFirebaseServices();
    mockUserCredential = MockUserCredential();
    appCubit = AppCubit(firebaseServices: mockFirebaseServices);
  });

  group('AppCubit', () {
    blocTest<AppCubit, AppState>(
      'emits [AuthLoading, AuthSuccessful] when Google sign-in succeeds',
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
          (_) async => (
            user: UserModel(uid: '123', firstName: 'Samuel'),
            error: null,
          ),
        );
        return appCubit;
      },
      act: (cubit) => cubit.signIn(true),
      expect: () => [isA<AuthLoading>(), isA<AuthSuccessful>()],
    );
  });
}
