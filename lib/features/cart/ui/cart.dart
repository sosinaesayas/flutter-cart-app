// import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
// import 'package:cart_app/features/cart/ui/cartTileWidget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class Cart extends StatefulWidget {
//   const Cart({super.key});

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   final CartBloc cartBloc = CartBloc();
//   @override
//   void initState(){
//     cartBloc.add(CartInitialEvent());
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart Items"),
//       ),
//       body: BlocConsumer<CartBloc, CartState>(
//         bloc:cartBloc,
//         listener: (context, state) {},
//         listenWhen: (previous, current) => current is CartActionState,
//         buildWhen: (previous, current) => current is !CartActionState,
//         builder: (context, state) {
//           switch(state.runtimeType){
//             case CartSuccessState:
//             final successState = state as CartSuccessState;
//             return ListView.builder(
//                 itemCount: successState.cartItems.length,
//                 itemBuilder: (context, index) {
//                   final productModel = successState.cartItems[index];
//                   return CartTileWidget(productModel: productModel, cartBloc: cartBloc);
//                 },
//               );

//             default:
//           }

//           return Container();
//         },
//       ),
//     );
//   }
// }


import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
import 'package:cart_app/features/cart/ui/cartTileWidget.dart';
import 'package:cart_app/features/home/models/home_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // final ProductModel productModel;
  final CartBloc cartBloc = CartBloc(productModel);
  
  static ProductModel? productModel;

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => !(current is CartActionState),
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  final productModel = successState.cartItems[index];
                  return CartTileWidget(productModel: productModel, cartBloc: cartBloc);
                },
              );
            default:
          }

          return Container();
        },
      ),
    );
  }
}
