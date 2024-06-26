// import "dart:io";
import "package:cart_app/features/cart/bloc/cart_bloc.dart";
import "package:cart_app/features/cart/ui/cart.dart";
import "package:cart_app/features/wishlist/ui/wishlist.dart";
import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:cart_app/features/home/bloc/home_bloc.dart";
import "package:cart_app/features/home/ui/listTile.dart";

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
    late CartBloc cartBloc;


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
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
          else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item added to wishlist',
            style: TextStyle(
              color: Colors.black
            ),),
            backgroundColor: Color.fromARGB(255, 205, 247, 255),
            
            
          ),
        );
      }

        else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item added to cart',
            style: TextStyle(
              color: Colors.black
            ),),
            backgroundColor: Color.fromARGB(255, 205, 247, 255),
          ),
        );
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
            final products = successState.products;
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTileWidget(
                    productModel: product, homeBloc: homeBloc, onTap: () {  },);
              },

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


// import 'package:cart_app/features/cart/ui/cart.dart';
// import 'package:cart_app/features/description/ui/description.dart';
// import 'package:cart_app/features/wishlist/ui/wishlist.dart';
// import 'package:cart_app/features/home/bloc/home_bloc.dart';
// import 'package:cart_app/features/home/ui/listTile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'description.dart'; // Import the Description page

// class ProductsListPage extends StatefulWidget {
//   const ProductsListPage({super.key});

//   @override
//   State<ProductsListPage> createState() => _ProductsListPageState();
// }

// class _ProductsListPageState extends State<ProductsListPage> {
//   @override
//   void initState() {
//     homeBloc.add(HomeInitialEvent());
//     super.initState();
//   }

//   int selectedPage = 0;
//   final HomeBloc homeBloc = HomeBloc();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBloc, HomeState>(
//       bloc: homeBloc,
//       listenWhen: (previous, current) => current is HomeActionState,
//       buildWhen: (previous, current) => current is! HomeActionState,
//       listener: (context, state) {
//         print(state);
//         print("listening");
//         if (state is HomeNavigateToCartPageActionState) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Cart()));
//         } else if (state is HomeNavigateToWishlistPageActionState) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Wishlist()));
//         } else if (state is HomeProductItemWishlistedActionState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 'Item added to wishlist',
//                 style: TextStyle(color: Colors.black),
//               ),
//               backgroundColor: Color.fromARGB(255, 205, 247, 255),
//             ),
//           );
//         } else if (state is HomeProductItemCartedActionState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 'Item added to cart',
//                 style: TextStyle(color: Colors.black),
//               ),
//               backgroundColor: Color.fromARGB(255, 205, 247, 255),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         switch (state.runtimeType) {
//           case HomeLoadingState:
//             return Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           case HomeLoaddedSuccessState:
//             final successState = state as HomeLoaddedSuccessState;
//             final products = successState.products;
//             return GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ListTileWidget(
//                   productModel: product,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Description(),
//                       ),
//                     );
//                   }, homeBloc:homeBloc,
//                 );
//               },
//             );
//           case HomeErrorState:
//             return Scaffold(
//               body: Center(child: Text("error")),
//             );
//           default:
//             return SizedBox();
//         }
//       },
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ProductsListPage(),
//   ));
// }

