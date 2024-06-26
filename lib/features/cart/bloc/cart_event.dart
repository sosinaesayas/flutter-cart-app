part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

class ItemRemoveFromCartEvent extends CartEvent{
  final String itemId;
  ItemRemoveFromCartEvent(this.itemId);
}

class CartIncrementEvent extends CartEvent{
  final String productId;
  CartIncrementEvent(this.productId);
}

class CartDecrementEvent extends CartEvent{
   final String productId;
  CartDecrementEvent(this.productId);
}

class CartCounterEvent extends CartEvent {}

class CheckoutEvent extends CartEvent {}