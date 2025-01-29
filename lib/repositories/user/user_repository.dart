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
  Future<void> updateUserInfo(UserEntity userEntity) {
    // TODO: implement updateUserInfo
    throw UnimplementedError();
  }

  @override
  Future<String> uploadPicture(String file, String userId) {
    // TODO: implement uploadPicture
    throw UnimplementedError();
  }

  @override
  Stream<UserEntity> get user => userApiClient.user;

  @override
  Future<void> singInWithApple() {
    // TODO: implement singInWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> singInWithGoogle() {
    // TODO: implement singInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getMyUser(String myUserId) {
    // TODO: implement getMyUser
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(UserEntity userEntity) async {
    await userApiClient.setUserData(userEntity: userEntity);
  }
}
