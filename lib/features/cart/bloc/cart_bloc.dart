import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/models/home_product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Map<String, int> itemCountMap = {}; 

  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartIncrementEvent>(cartIncrementEvent);
    on<CartDecrementEvent>(cartDecrementEvent);
    on<ItemRemoveFromCartEvent>(itemRemoveFromCartEvent);
  }

  Future<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    
    cartItems.forEach((item) {
      itemCountMap[item.id] = 0; 
    });
    emit(CartSuccessState(cartItems: cartItems, itemCountMap: itemCountMap, totalAmount: _calculateTotalAmount()));
  }

  void cartIncrementEvent(
      CartIncrementEvent event, Emitter<CartState> emit) {
    itemCountMap[event.productId] ??= 0; 
    itemCountMap[event.productId] =
        (itemCountMap[event.productId] ?? 0) + 1; 
    _emitStateWithTotalAmount(emit);
  }

  void cartDecrementEvent(
      CartDecrementEvent event, Emitter<CartState> emit) {
    if (itemCountMap[event.productId] != null &&
        itemCountMap[event.productId]! > 0) {
      itemCountMap[event.productId] =
          (itemCountMap[event.productId] ?? 0) - 1; 
      _emitStateWithTotalAmount(emit);
    }
  }

  void itemRemoveFromCartEvent(
      ItemRemoveFromCartEvent event, Emitter<CartState> emit) {
    itemCountMap.remove(event.itemId);

    
    cartItems.removeWhere((item) => item.id == event.itemId);

    _emitStateWithTotalAmount(emit);
  }

  void _emitStateWithTotalAmount(Emitter<CartState> emit) {
  double totalAmount = _calculateTotalAmount();
  emit(CartSuccessState(
    cartItems: cartItems,
    itemCountMap: itemCountMap,
    totalAmount: totalAmount, 
  ));
}

double _calculateTotalAmount() {
  double totalAmount = 0.0;
  for (var entry in itemCountMap.entries) {
    String productId = entry.key;
    int count = entry.value;
    ProductModel product = cartItems.firstWhere((item) => item.id == productId);
    totalAmount += product.price * count;
  }
  return totalAmount;
}


 
}
