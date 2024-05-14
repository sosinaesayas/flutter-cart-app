import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
import 'package:cart_app/features/cart/ui/cartTileWidget.dart';
import 'package:cart_app/features/home/models/home_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class Cart extends StatefulWidget {
//   const Cart({Key? key}) : super(key: key);

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   final CartBloc cartBloc = CartBloc();
  
  
//   @override
//   void initState() {
//     cartBloc.add(CartInitialEvent());
//     super.initState();
    
   

//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("total"),
        
//         actions: [
     
        

//         ElevatedButton.icon(
//   onPressed: () {
//     final currentState = cartBloc.state;
//     if (currentState is CartSuccessState) {
//       final totalAmount = currentState.totalAmount;
//       setState(() {
//         // total = '\$${totalAmount.toStringAsFixed(2)}';
//       });
//       print('Total Amount: \$${totalAmount.toStringAsFixed(2)}');
//     }
//   },
//   icon: Icon(Icons.shopping_cart_checkout_rounded),
//   label: Text("Checkout"),
// ),
// //  Text(TotalAmount),
//         ],
//     ),
//       body: BlocConsumer<CartBloc, CartState>(
//         bloc: cartBloc,
//         listener: (context, state) {},
//         listenWhen: (previous, current) => current is CartActionState,
//         buildWhen: (previous, current) => !(current is CartActionState),
//         builder: (context, state) {
//           switch (state.runtimeType) {
//             case CartSuccessState:
//               final successState = state as CartSuccessState;
//               return ListView.builder(
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


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  String appBarTitle = 'Cart'; // Initial title

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle), // Display the appBarTitle in the app bar
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              final currentState = cartBloc.state;
              if (currentState is CartSuccessState) {
                final totalAmount = currentState.totalAmount;
                setState(() {
                  appBarTitle = 'Total Amount: \$${totalAmount.toStringAsFixed(2)}';
                });
              }
            },
            icon: Icon(Icons.shopping_cart_checkout_rounded),
            label: Text("Checkout"),
          )
        ],
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
