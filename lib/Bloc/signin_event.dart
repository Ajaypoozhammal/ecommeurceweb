part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}
class FetchSignin extends SigninEvent {
  final String fullname;
  final String email;

  FetchSignin({required this.fullname, required this.email});

}
