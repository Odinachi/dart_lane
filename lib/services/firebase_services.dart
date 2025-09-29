import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Google Sign-In
  Future<({UserCredential? user, String? error})> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize();
      final googleUser =
          (await GoogleSignIn.instance.authenticate()).authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleUser.idToken,
      );
      return (user: await _auth.signInWithCredential(credential), error: null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return (user: null, error: e.message);
      }
      return (user: null, error: e.toString());
    }
  }

  // Apple Sign-In
  Future<({UserCredential? user, String? error})> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      return (
        user: await _auth.signInWithCredential(oauthCredential),
        error: null
      );
    } catch (e) {
      return (user: null, error: e.toString());
    }
  }
}
