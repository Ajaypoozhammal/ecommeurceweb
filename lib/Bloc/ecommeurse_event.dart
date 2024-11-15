part of 'ecommeurse_bloc.dart';

@immutable
sealed class EcommeurseEvent {}
class FetchEcommeurse extends EcommeurseEvent {
   final String fullname;
   final String email;
   final String password;

  FetchEcommeurse({required this.fullname, required this.email, required this.password});

}