import 'package:dartcoder/services/firebase_services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.firebaseServices}) : super(AuthInitial());
  final FirebaseServices firebaseServices;

  void signIn(bool isGoogle) async {
    emit(AuthLoading());

    final auth = isGoogle
        ? await firebaseServices.signInWithGoogle()
        : await firebaseServices.signInWithApple();

    if (auth.user != null) {
      emit(AuthSuccessful());
    } else {
      emit(AuthError(auth.error ?? "Sign in failed"));
    }
  }
}
