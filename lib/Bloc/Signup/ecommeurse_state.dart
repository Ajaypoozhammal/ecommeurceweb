part of 'ecommeurse_bloc.dart';

@immutable
sealed class EcommeurseState {}

final class EcommeurseInitial extends EcommeurseState {}
class EcommeurseBlocLoading extends EcommeurseState {}
class EcommeurseBlocLoaded extends EcommeurseState {}
class EcommeurseBlocError extends EcommeurseState {}