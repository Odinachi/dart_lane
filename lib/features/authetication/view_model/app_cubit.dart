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
  void signIn(
    bool isGoogle,
  ) async {
    emit(AuthLoading());

    final auth = isGoogle
        ? await firebaseServices.signInWithGoogle()
        : await firebaseServices.signInWithApple();

    if (auth.account != null) {
      ;
      emit(AuthSuccessful());
      createProfile(
        firstName: auth.givenName ?? "",
        lastName: auth.familyName ?? "",
      );
    } else {
      emit(AuthError(auth.error ?? "Sign in failed"));
    }
  }

  void signOut() async {
    await firebaseServices.signOut();
    emit(AuthLogout());
  }

  void getUserProfile() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    emit(AuthLoading());
    profile = (await firebaseServices.getProfile()).user;
    if (profile?.currentLevel != null) {
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
      String? currentLevel}) async {
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

  void updatePassedCourses(num id) async {
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    userProgress ??= userProgress
        ?.copyWith(passedCourses: [...?userProgress?.passedCourses, id]);
    emit(AuthInitial());
    await firebaseServices.updatePassedCourses(id);
  }

  void updateCurrentCourse(num id) async {
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    if (userProgress == null) {
      userProgress = UserProgressModel(
        currentCourse: id,
      );
    } else {
      userProgress = userProgress?.copyWith(currentCourse: id);
    }

    emit(AuthInitial());
    await firebaseServices.updateCurrentCourse(id);
  }

  void markProblemAsSolved(String id) async {
    if (userProgress?.passedDsa?.contains(id) == true) {
      return;
    }
    if (userProgress == null) {
      userProgress = UserProgressModel(
        passedDsa: [id],
      );
    } else {
      userProgress =
          userProgress?.copyWith(passedDsa: [...?userProgress?.passedDsa, id]);
    }
    await firebaseServices.markProblemAsSolved(id);
    emit(AppUpdateProgress());
  }
}
