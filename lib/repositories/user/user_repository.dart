import 'package:re_anime_app/api/models/user.dart';
import 'package:re_anime_app/api/user_api_client.dart';

import 'user.dart';

class UserRepository implements UserRepositoryInterface {
  final UserApiClient userApiClient;

  UserRepository({required this.userApiClient});

  @override
  Future<void> logOut() async {
    await userApiClient.logOut();
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await userApiClient.login(email: email, password: password);
  }

  @override
  Future<UserEntity> registration(
      {required UserEntity user, required String password}) async {
    return await userApiClient.registration(user: user, password: password);
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await userApiClient.resetPassword(email: email);
  }

  @override
  Future<void> updateUserInfo(UserEntity userEntity) async {
    await userApiClient.updateUserInfo(userEntity: userEntity);
  }

  @override
  Future<String> uploadPicture(String file, String userId) async {
    // await userApiClient.updateUserInfo(userEntity: userEntity)
    return '';
  }

  @override
  Stream<UserEntity> get user => userApiClient.user;

  @override
  Future<void> singInWithApple() async => await userApiClient.signInWithApple();

  @override
  Future<void> singInWithGoogle() async =>
      await userApiClient.signinWithGoogle();

  @override
  Future<UserEntity> getMyUser(String myUserId) async {
    return await userApiClient.getUserById(userId: myUserId);
  }

  @override
  Future<void> setUserData(UserEntity userEntity) async {
    await userApiClient.setUserData(userEntity: userEntity);
  }
}
