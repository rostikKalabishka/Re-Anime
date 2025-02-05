import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:re_anime_app/api/models/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class UserApiClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final usersCollection = FirebaseFirestore.instance.collection('user');

  Future<void> login({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserEntity> registration(
      {required UserEntity user, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: password);

      user = user.copyWith(id: userCredential.user?.uid);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserEntity> getUserById({required String userId}) async {
    try {
      return usersCollection
          .doc(userId)
          .get()
          .then((value) => UserEntity.fromJson(value.data()!));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> setUserData({required UserEntity userEntity}) async {
    try {
      await usersCollection.doc(userEntity.id).set(userEntity.toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> updateUserInfo({required UserEntity userEntity}) async {
    try {
      await usersCollection.doc(userEntity.id).update(userEntity.toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<UserEntity> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
      if (firebaseUser == null) {
        yield UserEntity.emptyUser;
      } else {
        try {
          final userDoc = await usersCollection.doc(firebaseUser.uid).get();
          if (userDoc.exists) {
            yield UserEntity.fromJson(userDoc.data()!);
          } else {
            yield UserEntity.emptyUser;
          }
        } catch (e) {
          log('Error fetching user data: $e');
          yield UserEntity.emptyUser;
        }
      }
    });
  }

  Future<void> signinWithGoogle() async {
    try {
      final googleSignInAccount = await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        return;
      } else {
        final googleAuth = await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          final DocumentSnapshot existingDoc =
              await usersCollection.doc(firebaseUser.uid).get();
          if (!existingDoc.exists) {
            final userEntity = UserEntity.emptyUser.copyWith(
                id: firebaseUser.uid,
                username: googleSignInAccount.displayName,
                email: googleSignInAccount.displayName,
                userImage: googleSignInAccount.photoUrl);
            await setUserData(userEntity: userEntity);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInWithApple() async {
    try {
      // Шаг 1: Запрос авторизации через Apple
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
      final AuthCredential credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final DocumentSnapshot existingDoc =
            await usersCollection.doc(firebaseUser.uid).get();

        if (!existingDoc.exists) {
          final UserEntity userEntity = UserEntity.emptyUser.copyWith(
              id: firebaseUser.uid,
              username: appleCredential.givenName,
              email: appleCredential.email);

          await setUserData(userEntity: userEntity);
        }
      }
    } catch (e) {
      print('Error during Apple sign-in: $e');
      rethrow;
    }
  }
}
