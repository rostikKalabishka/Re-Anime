part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginProcess extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginStateFailure extends LoginState {
  final Object error;

  const LoginStateFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
