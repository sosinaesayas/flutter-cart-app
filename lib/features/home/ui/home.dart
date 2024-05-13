import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:cart_app/features/home/bloc/home_bloc.dart';
import 'package:cart_app/features/home/ui/first_page.dart';
import 'package:cart_app/features/wishlist/ui/wishlist.dart';
import 'package:cart_app/features/cart/ui/cart.dart';
import 'package:cart_app/features/wishlist/bloc/wishlist_bloc.dart'; // Import WishlistBloc

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => WishlistBloc()), // Provide WishlistBloc
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 253, 249, 249),
          title: Text("Yigzu Electronics"),
        ),
        body: _buildPage(selectedPage),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          selectedItemColor: Colors.blue, // Change selected item color
          unselectedItemColor: Colors.grey, // Change unselected item color
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return FirstPage(homeBloc: homeBloc);
      case 1:
        return Wishlist();
      case 2:
        return Cart();
      default:
        return Container(); // Default case, return an empty container
    }
  }
}
