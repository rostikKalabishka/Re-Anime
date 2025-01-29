part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationProcess extends RegistrationState {}

final class RegistrationSuccess extends RegistrationState {}

final class RegistrationFailure extends RegistrationState {
  final Object error;

  const RegistrationFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}
