part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}
class FetchSignin extends SigninEvent {
  final String email;
  final String password;

  FetchSignin({required this.email, required this.password});



}
