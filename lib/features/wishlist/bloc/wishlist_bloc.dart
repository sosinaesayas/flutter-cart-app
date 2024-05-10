import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_app/data/wishlist_items.dart';
import 'package:cart_app/features/home/models/home_product.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
        emit(WishlistSuccessState(wishlistItems:wishlistItems));
      }
}


 
