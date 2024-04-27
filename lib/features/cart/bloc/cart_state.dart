part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState{
  final List<ProductModel> cartItems;
  CartSuccessState({required this.cartItems});
}

