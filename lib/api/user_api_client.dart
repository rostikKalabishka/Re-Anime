import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:re_anime_app/api/models/user.dart';
import 'package:rxdart/rxdart.dart';

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

  Future<void> updateUserInfo({required UserEntity userModel}) async {
    try {
      await usersCollection.doc(userModel.id).update(userModel.toJson());
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
}
