import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartcoder/features/authetication/models/user_model.dart';
import 'package:dartcoder/features/authetication/models/user_progress.dart';
import 'package:dartcoder/features/editor/models/dsa_list_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<OAuthCredential?> _getAppleCredential(isGoogle) async {
    if (isGoogle) {
      await GoogleSignIn.instance.initialize();
      final googleUser =
          (await GoogleSignIn.instance.authenticate()).authentication;

      return GoogleAuthProvider.credential(
        idToken: googleUser.idToken,
      );
    } else {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        webAuthenticationOptions: WebAuthenticationOptions(
            clientId: String.fromEnvironment("CLIENT_ID"),
            redirectUri: Uri.parse(String.fromEnvironment("REDIRECT_URI"))),
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      return OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
    }
  }

  // Google Sign-In
  Future<({UserCredential? account, String? error})> signInWithGoogle() async {
    try {
      final credential = await _getAppleCredential(true);
      return (
        account: await _auth.signInWithCredential(credential!),
        error: null
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return (account: null, error: e.message);
      }
      return (account: null, error: e.toString());
    }
  }

  // Apple Sign-In
  Future<({UserCredential? account, String? error})> signInWithApple() async {
    try {
      final credential = await _getAppleCredential(false);
      return (
        account: await _auth.signInWithCredential(credential!),
        error: null
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return (account: null, error: e.message);
      }

      return (account: null, error: e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn.instance.signOut();
  }

  Future<({bool? success, String? error})> saveProfile(UserModel user) async {
    try {
      final userDoc = _firestore.collection('Users').doc(user.uid);
      await userDoc.set(user.toJson());
      return (success: true, error: null);
    } catch (e) {
      return (success: false, error: e.toString());
    }
  }

  Future<({UserModel? user, String? error})> getProfile() async {
    try {
      final userDoc =
          _firestore.collection('Users').doc(_auth.currentUser?.uid);
      final userSnapshot = await userDoc.get();
      if (userSnapshot.exists) {
        return (user: UserModel.fromJson(userSnapshot.data()!), error: null);
      }
      return (user: null, error: "User not found");
    } catch (e) {
      return (user: null, error: e.toString());
    }
  }

  Future<({UserProgressModel? progress, String? error})>
      getUserProgress() async {
    try {
      final progressDoc = _firestore
          .collection('Users')
          .doc(_auth.currentUser?.uid)
          .collection('progress')
          .doc('current');
      final progressSnapshot = await progressDoc.get();
      if (progressSnapshot.exists) {
        return (
          progress: UserProgressModel.fromJson(progressSnapshot.data()!),
          error: null
        );
      }
      return (progress: null, error: "User progress not found");
    } catch (e) {
      return (progress: null, error: e.toString());
    }
  }

  Future<void> updateCurrentCourse(num courseId) async {
    final progressDoc = _firestore
        .collection('Users')
        .doc(_auth.currentUser?.uid)
        .collection('progress')
        .doc('current');

    await progressDoc
        .set({'current_course': courseId}, SetOptions(merge: true));
  }

  Future<void> updatePassedCourses(num courseId) async {
    final progressDoc = _firestore
        .collection('Users')
        .doc(_auth.currentUser?.uid)
        .collection('progress')
        .doc('current');

    await progressDoc.set({
      'passed_courses': FieldValue.arrayUnion([courseId])
    }, SetOptions(merge: true));
  }

  Future<({bool? deleted, String? error})> deleteAccount() async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        final cred = await _getAppleCredential(
            _auth.currentUser?.providerData.firstOrNull?.providerId ==
                'google.com');

        if (cred == null) {
          return (deleted: false, error: "Re-authentication failed.");
        }
        // Reauthenticate user before deletion
        await user.reauthenticateWithCredential(cred);

        // Delete user data from Firestore
        await _firestore.collection('Users').doc(user.uid).delete();

        // Delete user authentication
        await user.delete();
        return (deleted: true, error: null);
      } else {
        return (deleted: false, error: "No user is currently signed in.");
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return (deleted: false, error: e.message);
      }
      return (deleted: false, error: e.toString());
    }
  }

  Future<
      ({
        List<DsaListModel>? documents,
        DocumentSnapshot? lastDocument,
        String? error
      })> fetchDSA({
    int limit = 10,
    DocumentSnapshot? startAfterDocument,
  }) async {
    try {
      var query = _firestore
          .collection('DSA')
          .withConverter(
              fromFirestore: (snapshot, _) =>
                  DsaListModel.fromJson(snapshot.data()!, id: snapshot.id),
              toFirestore: (model, _) => model.toJson())
          .orderBy("difficulty")
          .limit(limit);

      if (startAfterDocument != null) {
        query = query.startAfterDocument(startAfterDocument);
      }

      final dsaSnapshot = await query.get();
      final data = dsaSnapshot.docs.map((doc) => doc.data()).toList();

      return (
        documents: data,
        lastDocument:
            dsaSnapshot.docs.isNotEmpty ? dsaSnapshot.docs.last : null,
        error: null
      );
    } catch (e) {
      return (documents: null, lastDocument: null, error: e.toString());
    }
  }


 fetchDsaProblems(String id) async {
    try {
      final collectionSnapshot = await _firestore.collection('DSA').doc(id).collection("problems").get();
      return collectionSnapshot.docs
          .map((doc) => DsaListModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      return <DsaListModel>[];
    }
  }
}
