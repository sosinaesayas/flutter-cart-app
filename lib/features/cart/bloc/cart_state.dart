part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}

final class CartInitial extends CartState {}

// final class CartSuccessState extends CartState{
//   final List<ProductModel> cartItems;
 
//   CartSuccessState({required this.cartItems, required Map<String, int> itemCountMap, required double totalAmount});
// }

final class CartCounterState extends CartActionState{
  int count;
  CartCounterState(this.count);
}

final class CartSuccessState extends CartState {
  final List<ProductModel> cartItems;
  final Map<String, int> itemCountMap;
  final double totalAmount;

  CartSuccessState({
    required this.cartItems,
    required this.itemCountMap,
    required this.totalAmount,
  });

  @override
  List<Object?> get props => [cartItems, itemCountMap, totalAmount];
}


