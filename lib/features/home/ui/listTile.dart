import 'package:flutter/material.dart';
import "package:cart_app/features/home/models/home_product.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:cart_app/features/home/bloc/home_bloc.dart";

class ListTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;
  const ListTileWidget({Key? key, required this.productModel, required this.homeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Container(
      constraints: BoxConstraints(
        
      ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color:Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:DecorationImage(
                  fit:BoxFit.cover,
                  image: AssetImage(productModel.imageUrl),
                )
              ),
            ),
            SizedBox(height: 20),
            Text(productModel.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              ),
            ),
            
            SizedBox(height: 10),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$" + productModel.price.toString(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(
                            clickedProduct: productModel
                          ));
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductCartButtonClickedEvent(
                            clickedProduct: productModel
                          ));
                        },
                        icon: Icon(Icons.shopping_bag_outlined)),
                  
                  ],
                )
              ],
            ),
          ],
        ),
      
    );
 
  }
}

