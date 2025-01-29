import 'package:re_anime_app/api/models/user.dart';

abstract interface class UserRepositoryInterface {
  Future<void> login({required String email, required String password});

  Future<UserEntity> registration(
      {required UserEntity user, required String password});

  Future<void> resetPassword({required String email});

  Future<void> logOut();

  Stream<UserEntity> get user;

  Future<void> setUserData(UserEntity userEntity);

  Future<UserEntity> getMyUser(String myUserId);

  Future<String> uploadPicture(String file, String userId);

  Future<void> updateUserInfo(UserEntity userEntity);

  Future<void> singInWithGoogle();

  Future<void> singInWithApple();
}
