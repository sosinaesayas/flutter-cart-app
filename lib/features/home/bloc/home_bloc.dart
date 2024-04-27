import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_app/data/cart_items.dart';
import 'package:cart_app/data/wishlist_items.dart';
import 'package:cart_app/features/home/models/home_product.dart';
// import 'package:cart_app/features/home/ui/home.dart';
// import "package:cart_app/features/home/models/home_product.dart";
import "package:cart_app/data/data.dart";
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoaddedSuccessState(
        products: Grocery.groceryProducts
            .map((e) => ProductModel(
                id: e["id"],
                name: e["name"],
                description: e["description"],
                price: e["price"],
                ImageUrl: e["ImageUrl"]))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
      print("wishlist click");
      wishlistItems.add(event.clickedProduct);
      emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("navigate wishlist");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("navigate cart");
    emit(HomeNavigateToCartPageActionState());
  }
}
