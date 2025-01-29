import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/api/models/user.dart';
import 'package:re_anime_app/repositories/user/user_repository_interface.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRepositoryInterface _userRepository;
  RegistrationBloc({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository,
        super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) async {
      if (event is RegistrationRequired) {
        await _registration(event, emit);
      }
    });
  }
  Future<void> _registration(RegistrationRequired event, emit) async {
    emit(RegistrationProcess());
    try {
      UserEntity user = UserEntity.emptyUser
          .copyWith(email: event.email, username: event.username);

      final newUser = await _userRepository.registration(
          user: user, password: event.password);

      await _userRepository.setUserData(newUser);
      emit(RegistrationSuccess());
    } catch (e) {
      emit(RegistrationFailure(error: e));
    }
  }
}
