part of 'banner_bloc.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}
class BannerBlocLoading extends BannerState {}
class BannerBlocLoaded extends BannerState {}
class BannerBlocError extends BannerState {}