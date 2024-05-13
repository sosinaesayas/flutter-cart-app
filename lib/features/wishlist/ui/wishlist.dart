import 'package:cart_app/features/home/bloc/home_bloc.dart';
import 'package:cart_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:cart_app/features/wishlist/ui/wishlistTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late final WishlistBloc wishlistBloc;

  @override
  void initState() {
    wishlistBloc = BlocProvider.of<WishlistBloc>(context);
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist Items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if (state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Item added to cart',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Color.fromARGB(255, 205, 247, 255),
              ),
            );
          }
        },

        builder: (context, state) {
          if (state is WishlistSuccessState) {
            return ListView.builder(
              itemCount: state.wishlistItems.length,
              itemBuilder: (context, index) {
                final wishlistProduct = state.wishlistItems[index];
                return BlocProvider.value(
                  value: wishlistBloc,
                  child: BlocProvider(
                    create: (context) => HomeBloc(), // Provide HomeBloc
                    child: WishlistTileWidget(
                      productModel: wishlistProduct, wishlistBloc: wishlistBloc,
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}


