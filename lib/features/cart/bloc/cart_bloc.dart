import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/models/home_product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   int counter = 0; // Counter value in the bloc state

//  CartBloc() : super(CartInitial()) {
//   on<CartInitialEvent>(cartInitialEvent);
//   on<CartIncrementEvent>(cartIncrementEvent);
//   on<CartDecrementEvent>(cartDecrementEvent);
//   on<ItemRemoveFromCartEvent>(itemRemoveFromCartEvent); // Register the event handler here
// }


//   FutureOr<void> cartInitialEvent(
//       CartInitialEvent event, Emitter<CartState> emit) {
//     emit(CartSuccessState(cartItems: cartItems));
//   }

//   void cartIncrementEvent(CartIncrementEvent event, Emitter<CartState> emit) {
//     counter++;
//     print("added");
//     emit(CartCounterState(counter));
//   }

//   void cartDecrementEvent(CartDecrementEvent event, Emitter<CartState> emit) {
//     if (counter > 0) {
//       counter--;
//       print("minimized");
//       emit(CartCounterState(counter));
//     }
//   }

//  void itemRemoveFromCartEvent(
//   ItemRemoveFromCartEvent event, Emitter<CartState> emit) {
//   cartItems.removeWhere((item) => item.id == event.itemId);
//   emit(CartSuccessState(cartItems: cartItems)); 
// }

// }



class CartBloc extends Bloc<CartEvent, CartState> {
  // final ProductModel productModel;
  final ProductModel? productModel;

  Map<String, int> itemCountMap = {}; // Map to store product IDs and their counts

  CartBloc(this.productModel) : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartIncrementEvent>(cartIncrementEvent);
    on<CartDecrementEvent>(cartDecrementEvent);
    on<ItemRemoveFromCartEvent>(itemRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    // Initialize the itemCountMap with product IDs and their counts
    cartItems.forEach((item) {
      itemCountMap[item.id] = 0; // Initially, all counts are zero
    });
    emit(CartSuccessState(cartItems: cartItems));
  }

 void cartIncrementEvent(CartIncrementEvent event, Emitter<CartState> emit) {
  itemCountMap[event.productId] ??= 0; // Initialize to 0 if null
  itemCountMap[event.productId] = (itemCountMap[event.productId] ?? 0) + 1; // Increment safely
  emit(CartCounterState(itemCountMap[event.productId] ?? 0));
}

void cartDecrementEvent(CartDecrementEvent event, Emitter<CartState> emit) {
  final currentCount = itemCountMap[event.productId];
  if (currentCount != null && currentCount > 0) { // Check if count is not null and greater than 0
    itemCountMap[event.productId] = currentCount - 1; // Decrement safely
  }
  emit(CartCounterState(itemCountMap[event.productId] ?? 0));
}


  void itemRemoveFromCartEvent(
      ItemRemoveFromCartEvent event, Emitter<CartState> emit) {
    // Remove the product with the given ID from the itemCountMap
    itemCountMap.remove(event.productId);
    emit(CartSuccessState(
        cartItems: cartItems)); // You might need to update cartItems accordingly
  }
}
