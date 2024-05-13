// import "package:cart_app/data/cart_items.dart";
// import "package:cart_app/features/cart/bloc/cart_bloc.dart";
// import 'package:flutter/material.dart';
// import "package:cart_app/features/home/models/home_product.dart";
// import "package:flutter/rendering.dart";
// import "package:flutter/widgets.dart";


// class CartTileWidget extends StatelessWidget {
//   final ProductModel productModel;
//   final CartBloc cartBloc;
//   const CartTileWidget({Key? key, required this.productModel, required this.cartBloc}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     int counter = 0;
  
 
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color:Colors.black12),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(10),
//       child: Row(
//         children: <Widget>[
//           // Image
//           Container(
//             width: 150,
//             height: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),    
//               image: DecorationImage(
//                 fit:BoxFit.cover,
//                 image: AssetImage(productModel.imageUrl))
//             ),
//           ),
//           SizedBox(width: 10), 
//           // Name and Price
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   productModel.name,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "\$" + productModel.price.toString(),
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 10), // Adjust spacing as needed
//           // Icons
//           Column(
//              children: <Widget>[
//                IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: () {
//                   // Dispatch increment event to the CartBloc
//                   cartBloc.add(CartIncrementEvent());
//                     counter++;
//                 },
//               ),
//               Text(counter.toString()),
//               IconButton(
//                 icon: Icon(Icons.minimize),
//                 onPressed: (){
//                   cartBloc.add(CartDecrementEvent());
//                   counter --;
//                 },
//                 ),
//               SizedBox(height: 25),
//               Icon(Icons.delete)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cart_app/features/home/models/home_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_app/features/cart/bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    Key? key,
    required this.productModel,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int counter = 0;

        if (state is CartCounterState) {
          counter = state.count;
        }

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              // Image
              Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(productModel.imageUrl),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Name and Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productModel.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\$" + productModel.price.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              // Icons
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Dispatch increment event to the CartBloc
                      cartBloc.add(CartIncrementEvent());
                    },
                  ),
                  Text(counter.toString()), // Display the counter value
                  IconButton(
                    icon: Icon(Icons.minimize),
                    onPressed: () {
                      // Dispatch decrement event to the CartBloc
                      cartBloc.add(CartDecrementEvent());
                    },
                  ),
                  SizedBox(height: 25),
                  Icon(Icons.delete),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}


