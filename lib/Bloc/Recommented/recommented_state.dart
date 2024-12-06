part of 'recommented_bloc.dart';

@immutable
sealed class RecommentedState {}

final class RecommentedInitial extends RecommentedState {}
class RecommentedBlocLoading extends RecommentedState {}
class RecommentedBlocLoaded extends RecommentedState {}
class RecommentedBlocError extends RecommentedState {}