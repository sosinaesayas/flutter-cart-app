import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/models/home_product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int counter = 0; // Counter value in the bloc state

  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartIncrementEvent>(cartIncrementEvent); 
    on<CartDecrementEvent>(cartDecrementEvent); 
  }

   FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  void cartIncrementEvent(
    CartIncrementEvent event, Emitter<CartState> emit) {
    counter++;
    print("added");
    emit(CartCounterState(counter)); 
  }

  void cartDecrementEvent(
      CartDecrementEvent event, Emitter<CartState> emit) {
    if (counter > 0) {
      counter--;
      print("minimized");
      emit(CartCounterState(counter)); 
    }
  }
}
