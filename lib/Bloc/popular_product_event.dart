part of 'popular_product_bloc.dart';

@immutable
sealed class PopularProductEvent {}
class FetchPopularProduct extends PopularProductEvent {}