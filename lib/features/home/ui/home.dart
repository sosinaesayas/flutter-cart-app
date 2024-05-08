import "package:cart_app/features/cart/ui/cart.dart";
import "package:cart_app/features/home/ui/tabBar/tvTabBar.dart";
import "package:cart_app/features/home/ui/tabBar/phoneTabBar.dart";
import "package:cart_app/features/home/ui/tabBar/pcTabBar.dart";
import "package:cart_app/features/wishlist/ui/wishlist.dart";
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:cart_app/features/home/bloc/home_bloc.dart";
import "package:cart_app/features/home/ui/listTile.dart";
import "package:cart_app/features/home/ui/tabBar/tabBar.dart";


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
  int selectedPage = 0;
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        print(state);
        print("listening");
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } 
        else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
        else if (state is HomeProductItemWishlistedActionState){
          print("state is here");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Item added to Wishlist")));
        }

      else if(state is HomeProductItemCartedActionState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to Cart")));
      }

      // else if (state is TvTabSelectedActionState){
      //   Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => TvTabBar()));
      // }

      //  else if (state is PcTabSelectedActionState){
      //   Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => PcTabBar()));
      // }

      //  else if (state is  PhoneTabSelectedActionState){
      //   Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => PhoneTabBar()));
      // }
      },
      builder: (context, state) {
        List<Widget> pages = [
          TabBarWidget(homeBloc: homeBloc) , 
          Text("Page  two"), 
          Text("page three")
        ];
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
              body: pages[selectedPage], 
              // ListView.builder(
              //   itemCount: successState.products.length,
              //   itemBuilder: (context, index) {
              //     final productModel = successState.products[index];
              //     return ListTileWidget(productModel: productModel, homeBloc: HomeBloc());
              //   },
              // ),
              bottomNavigationBar: Row(children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPage = 0;
                      });
                    },
                    child: Icon(Icons.home),
                  ), 
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPage = 1;
                      });
                    },
                    child: Icon(Icons.person),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPage = 2;
                      });
                    },
                    child: Icon(Icons.phone),
                  )
              ],),
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


