part of 'auth_by_another_bloc.dart';

sealed class AuthByAnotherEvent extends Equatable {
  const AuthByAnotherEvent();

  @override
  List<Object> get props => [];
}

class AuthWithGoogleEvent extends AuthByAnotherEvent {}

class AuthWithAppleEvent extends AuthByAnotherEvent {}
