// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
// import 'package:cart_app/features/cart/ui/cartTileWidget.dart';

// class Cart extends StatefulWidget {
//   const Cart({Key? key}) : super(key: key);

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   late CartBloc cartBloc;

//   @override
//   void initState() {
//     super.initState();
//     cartBloc = CartBloc()..add(CartInitialEvent());
//   }
//   String Value = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//       ),
//       body: BlocConsumer<CartBloc, CartState>(
//         bloc: cartBloc,
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is CartSuccessState) {
//                 Value ='\$${state.totalAmount.toStringAsFixed(2)}';
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: state.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final productModel = state.cartItems[index];
//                       return CartTileWidget(productModel: productModel, cartBloc: cartBloc);
//                     },
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.all(8.0),
//                 //   child: Text(
//                 //     'Total Amount: \$${state.totalAmount.toStringAsFixed(2)}',
//                 //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 //   ),
//                 // ),
//               ],
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Row(
//             children: [
//              Text(
//                     "value: $Value",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement checkout logic here
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.shopping_cart_checkout_rounded),
//                     SizedBox(width: 8),
//                     Text("Checkout"),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     cartBloc.close();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
import 'package:cart_app/features/cart/ui/cartTileWidget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late CartBloc cartBloc;

  @override
  void initState() {
    super.initState();
    cartBloc = CartBloc()..add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final productModel = state.cartItems[index];
                      return CartTileWidget(productModel: productModel, cartBloc: cartBloc);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Amount: \$${state.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // Implement checkout logic here
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_checkout_rounded),
                SizedBox(width: 8),
                Text("Checkout"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cartBloc.close();
    super.dispose();
  }
}
