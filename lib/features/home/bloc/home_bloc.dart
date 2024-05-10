import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_app/data/cart_items.dart';
import 'package:cart_app/data/data2.dart';
import 'package:cart_app/data/wishlist_items.dart';
import 'package:cart_app/features/home/models/home_product.dart';
// import "package:cart_app/data/data.dart";
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<PcTabSelectEvent>(pcTabSelectEvent);
    on<TvTabSelectEvent>(tvTabSelectEvent);
    on<PhoneTabSelectEvent>(phoneTabSelectEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeLoaddedSuccessState(
        products: Electronics.electronicsProducts
            .map((e) => ProductModel.fromJson(e))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("wishlist clicked");
    wishlistItems.add(event.clickedProduct);
    // print("emitting");
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
    print("navigate to wishlist");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("navigate to cart");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> pcTabSelectEvent(
      PcTabSelectEvent event, Emitter<HomeState> emit) {
    print("pc tab is selected");
    emit(PcTabSelectedActionState());
  }

  FutureOr<void> tvTabSelectEvent(
      TvTabSelectEvent event, Emitter<HomeState> emit) {
    print("tv tab is selected");
    emit(TvTabSelectedActionState());
  }

  FutureOr<void> phoneTabSelectEvent(
      PhoneTabSelectEvent event, Emitter<HomeState> emit) {
        print("phone tba is selected");
        emit(PhoneTabSelectedActionState());
      }
}
