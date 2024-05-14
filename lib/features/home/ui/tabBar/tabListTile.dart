import "dart:ui";

import 'package:flutter/material.dart';
import "package:cart_app/features/home/models/home_product.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:cart_app/features/home/bloc/home_bloc.dart";

class TabListTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;
  const TabListTileWidget(
      {Key? key, required this.productModel, required this.homeBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 90,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(productModel.imageUrl),
                )),
          ),
          SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        clickedProduct: productModel));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Item added to wishlist',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Color.fromARGB(255, 205, 247, 255),
                      ),
                    );
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: productModel));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "item added to cart",
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Color.fromARGB(255, 205, 247, 255),
                      ),
                    );
                  },
                  icon: Icon(Icons.shopping_bag_outlined)),
            ],
          ),
        ],
      ),
    );
  }
}
