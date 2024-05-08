part of 'home_bloc.dart';
// import "package:cart_app/features/home/models/home_product.dart";

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoaddedSuccessState extends HomeState{
  final List<ProductModel> products;
  HomeLoaddedSuccessState({
    required this.products
  });
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeProductItemWishlistedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}

class PcTabSelectedActionState extends HomeActionState{}

class TvTabSelectedActionState extends HomeActionState{}

class PhoneTabSelectedActionState extends HomeActionState{}