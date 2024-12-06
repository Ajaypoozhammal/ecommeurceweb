part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}
class SigninBlocLoading extends SigninState {}
class SigninBlocLoaded extends SigninState {}
class SigninBlocError extends SigninState {}