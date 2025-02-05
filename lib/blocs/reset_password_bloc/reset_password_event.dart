part of 'reset_password_bloc.dart';

class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}
