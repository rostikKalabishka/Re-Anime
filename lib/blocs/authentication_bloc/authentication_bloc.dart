import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/api/models/user.dart';
import 'package:re_anime_app/repositories/user/user_repository_interface.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepositoryInterface _userRepository;
  late final StreamSubscription<UserEntity> _userSubscription;
  AuthenticationBloc({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _userRepository.user.listen((user) {
      log('User subscription received: $user');
      add(AuthenticationUserChanged(user));
    });
    on<AuthenticationUserChanged>((event, emit) {
      final UserEntity user = event.user;
      try {
        if (user != UserEntity.emptyUser) {
          print('User authenticated: $user');
          emit(AuthenticationState.authenticated(user));
        } else {
          emit(const AuthenticationState.unauthenticated());
        }
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
