part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{}

class ItemRemoveFromWishlistEvent extends WishlistEvent{
   final String itemId;
  ItemRemoveFromWishlistEvent(this.itemId);
  // @override
  // List<Object?> get props => [itemId];

  }