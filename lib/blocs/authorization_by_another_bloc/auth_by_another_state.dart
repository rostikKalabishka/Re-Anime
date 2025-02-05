part of 'auth_by_another_bloc.dart';

sealed class AuthByAnotherState extends Equatable {
  const AuthByAnotherState();

  @override
  List<Object> get props => [];
}

final class AuthByAnotherInitial extends AuthByAnotherState {}

final class AuthByAnotherProcess extends AuthByAnotherState {}

final class AuthByAnotherSuccess extends AuthByAnotherState {}

final class AuthByAnotherFailure extends AuthByAnotherState {
  final Object error;

  const AuthByAnotherFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
