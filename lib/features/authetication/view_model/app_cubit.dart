import 'package:dartcoder/features/authetication/models/user_model.dart';
import 'package:dartcoder/features/authetication/models/user_progress.dart';
import 'package:dartcoder/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.firebaseServices}) : super(AuthInitial());
  final FirebaseServices firebaseServices;

  UserModel? profile;
  UserProgressModel? userProgress;
  void signIn(bool isGoogle) async {
    emit(AuthLoading());

    final auth = isGoogle
        ? await firebaseServices.signInWithGoogle()
        : await firebaseServices.signInWithApple();

    if (auth.account != null) {
      emit(AuthSuccessful());
    } else {
      emit(AuthError(auth.error ?? "Sign in failed"));
    }
  }

  void signOut() async {
    await firebaseServices.signOut();
    emit(AuthLogout());
  }

  void getUserProfile() async {
    emit(AuthLoading());
    profile = (await firebaseServices.getProfile()).user;
    if (profile != null) {
      userProgress = (await firebaseServices.getUserProgress()).progress;
      emit(AuthProfileExists());
    } else {
      emit(AuthProfileMissing());
    }
  }

  void deleteAccount() async {
    emit(AuthLoading());
    final result = await firebaseServices.deleteAccount();

    if (result.deleted == true) {
      emit(AuthLogout());
    } else {
      emit(AuthError(result.error ?? "Account deletion failed"));
    }
  }

  void createProfile(
      {required String firstName,
      required String lastName,
      required String currentLevel}) async {
    emit(AuthLoading());
    final result = await firebaseServices.saveProfile(UserModel(
        uid: FirebaseAuth.instance.currentUser?.uid ?? '',
        firstName: firstName,
        lastName: lastName,
        createdAt: DateTime.now(),
        currentLevel: currentLevel,
        email: FirebaseAuth.instance.currentUser?.email ?? ''));
    if (result.success == true) {
      profile = (await firebaseServices.getProfile()).user;
      emit(AuthProfileCreated());
    } else {
      emit(AuthError("Profile creation failed"));
    }
  }

  void updatePassedCourses(num id) async =>
      firebaseServices.updatePassedCourses(id);
  void updateCurrentCourse(num id) async =>
      firebaseServices.updateCurrentCourse(id);
}
