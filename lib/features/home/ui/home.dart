import "package:cart_app/features/cart/ui/cart.dart";
import "package:cart_app/features/wishlist/ui/wishlist.dart";
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:cart_app/features/home/bloc/home_bloc.dart";
import "package:cart_app/features/home/ui/listTile.dart";


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } 
        else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
        else if (state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Item added to Wishlist")));
        }

      else if(state is HomeProductItemCartedActionState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to Cart")));
      }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeLoaddedSuccessState:
            final successState = state as HomeLoaddedSuccessState;
            return Scaffold(
              backgroundColor: Color.fromARGB(255, 216, 243, 222),
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 88, 209, 191),
                title: Text("Yigzu Electronics"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  final productModel = successState.products[index];
                  return ListTileWidget(productModel: productModel, homeBloc: HomeBloc());
                },
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("error")),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}


