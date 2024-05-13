import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
import 'package:cart_app/features/home/models/home_product.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatefulWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    Key? key,
    required this.productModel,
    required this.cartBloc,
  }) : super(key: key);

  @override
  _CartTileWidgetState createState() => _CartTileWidgetState();
}

class _CartTileWidgetState extends State<CartTileWidget> {
  @override
  Widget build(BuildContext context) {
    int itemCount = widget.cartBloc.itemCountMap[widget.productModel.id] ?? 0;

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
                image: AssetImage(widget.productModel.imageUrl),
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
                  widget.productModel.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "\$" + widget.productModel.price.toString(),
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
                  widget.cartBloc.add(CartIncrementEvent(widget.productModel.id));
                },
              ),
              Text(itemCount.toString()), 
              IconButton(
                icon: Icon(Icons.minimize),
                onPressed: () {
                  widget.cartBloc.add(CartDecrementEvent(widget.productModel.id));
                },
              ),
              SizedBox(height: 25),
              IconButton(
                onPressed: () {
                  String itemId = widget.productModel.id;
                  widget.cartBloc.add(ItemRemoveFromCartEvent(itemId));
                },
                icon: Icon(Icons.delete),
              )
            ],
          ),
        ],
      ),
    );
  }
}
