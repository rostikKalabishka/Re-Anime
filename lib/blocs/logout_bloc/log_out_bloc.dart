import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/repositories/user/user.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  final UserRepositoryInterface _userRepository;
  LogOutBloc({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository,
        super(LogOutInitial()) {
    on<LogOutEvent>(_logOut);
  }

  Future<void> _logOut(event, emit) async {
    emit(LogOutProcess());
    try {
      await _userRepository.logOut();
      emit(LogOutSuccess());
    } catch (e) {
      emit(LogOutFailure(error: e));
    }
  }
}
