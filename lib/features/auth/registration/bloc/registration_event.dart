part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationRequired extends RegistrationEvent {
  final String password;
  final String email;
  final String username;

  const RegistrationRequired({
    required this.password,
    required this.email,
    required this.username,
  });
}
