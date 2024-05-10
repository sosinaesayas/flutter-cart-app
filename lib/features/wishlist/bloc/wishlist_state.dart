part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSuccessState extends WishlistState{
  final List<ProductModel> wishlistItems;
  WishlistSuccessState({required this.wishlistItems});

}




