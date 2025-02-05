import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/repositories/user/user.dart';

part 'auth_by_another_event.dart';
part 'auth_by_another_state.dart';

class AuthByAnotherBloc extends Bloc<AuthByAnotherEvent, AuthByAnotherState> {
  final UserRepositoryInterface _userRepository;
  AuthByAnotherBloc({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository,
        super(AuthByAnotherInitial()) {
    on<AuthByAnotherEvent>((event, emit) async {
      if (event is AuthWithGoogleEvent) {
        await _signInWithGoogle(event, emit);
      } else if (event is AuthWithAppleEvent) {
        await _signInWithApple(event, emit);
      }
    });
  }
  Future<void> _signInWithGoogle(AuthWithGoogleEvent event, emit) async {
    emit(AuthByAnotherProcess());
    try {
      await _userRepository.singInWithGoogle();
      emit(AuthByAnotherSuccess());
    } catch (e) {
      emit(AuthByAnotherFailure(error: e));
    }
  }

  Future<void> _signInWithApple(AuthWithAppleEvent event, emit) async {
    emit(AuthByAnotherProcess());
    try {
      await _userRepository.singInWithApple();
      emit(AuthByAnotherSuccess());
    } catch (e) {
      emit(AuthByAnotherFailure(error: e));
    }
  }
}
