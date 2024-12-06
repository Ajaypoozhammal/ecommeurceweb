part of 'popular_product_bloc.dart';

@immutable
sealed class PopularProductState {}

final class PopularProductInitial extends PopularProductState {}
class PopularProductBlocLoading extends PopularProductState {}
class PopularProductBlocLoaded extends PopularProductState {}
class PopularProductBlocError extends PopularProductState {}