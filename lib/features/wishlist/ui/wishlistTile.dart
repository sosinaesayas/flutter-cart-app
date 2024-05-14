import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_app/features/home/models/home_product.dart';
import 'package:cart_app/features/home/bloc/home_bloc.dart';
import 'package:cart_app/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget({
    Key? key,
    required this.productModel,
    required this.wishlistBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(width: 30), // Adjust spacing as needed
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
          Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Get the HomeBloc instance from the widget tree
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  // Dispatch the event using the bloc instance
                  homeBloc.add(HomeProductCartButtonClickedEvent(
                    clickedProduct: productModel,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Item added to cart',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Color.fromARGB(255, 205, 247, 255),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_basket_sharp),
                label: Text("Add to Cart"),
              ),
              SizedBox(height: 30),
              IconButton(
                onPressed: () {
                  String itemId = productModel.id;
                  wishlistBloc.add(ItemRemoveFromWishlistEvent(itemId));
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
