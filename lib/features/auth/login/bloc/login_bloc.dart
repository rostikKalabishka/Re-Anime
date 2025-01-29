import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/repositories/user/user_repository_interface.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepositoryInterface _userRepository;
  LoginBloc({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository,
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginRequired) {
        await _login(event, emit);
      }
    });
  }
  Future<void> _login(LoginRequired event, emit) async {
    emit(LoginProcess());
    try {
      await _userRepository.login(email: event.email, password: event.password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginStateFailure(error: e));
    }
  }
}
