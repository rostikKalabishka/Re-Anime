import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/repositories/user/user.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final UserRepositoryInterface _userRepository;
  ResetPasswordBloc({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository,
        super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async {
      await _resetPassword(event, emit);
    });
  }

  Future<void> _resetPassword(ResetPasswordEvent event, emit) async {
    emit(ResetPasswordProcess());
    try {
      await _userRepository.resetPassword(email: event.email);

      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(error: e));
    }
  }
}
