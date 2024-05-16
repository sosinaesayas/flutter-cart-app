import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
import 'package:cart_app/features/cart/ui/cart.dart';
import 'package:cart_app/features/description/ui/description.dart';
import 'package:cart_app/features/home/ui/home.dart';
import 'package:cart_app/features/person/person_page.dart';
import 'package:cart_app/features/wishlist/ui/wishlist.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(), // Pass selectedPage for the Home route
      routes: [
        GoRoute(
          path: 'wishlist',
          builder: (context, state) => Wishlist(),
        ),
        GoRoute(
          path: 'cart',
          builder: (context, state) => Cart(),
        ),
        GoRoute(
          path: 'description',
          builder: (context, state) => Description(),
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) => PersonPage(),
        ),
      ],
    ),
  ],
);
