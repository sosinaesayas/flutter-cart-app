import 'package:cart_app/features/cart/bloc/cart_bloc.dart';
import 'package:cart_app/features/description/ui/description.dart';
import 'package:cart_app/features/person/person_page.dart';
import 'package:cart_app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_app/features/home/bloc/home_bloc.dart';
import 'package:cart_app/features/home/ui/first_page.dart';
import 'package:cart_app/features/wishlist/ui/wishlist.dart';
import 'package:cart_app/features/cart/ui/cart.dart';
import 'package:cart_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  int selectedPage = 0;
  final HomeBloc homeBloc = HomeBloc();

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/wishlist');
        break;
      case 2:
        context.go('/cart');
        break;
      case 3:
        context.go('/description');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => WishlistBloc()),
      ],
      child: Scaffold(
        
        body: _buildPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
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
              icon: Icon(Icons.description_outlined),
              label: 'Description',
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

  Widget _buildPage() {
    return GoRouter.of(context).location == '/' ? FirstPage(homeBloc: homeBloc)
      : GoRouter.of(context).location == '/wishlist' ? Wishlist()
      : GoRouter.of(context).location == '/cart' ? Cart()
      : GoRouter.of(context).location == '/description' ? Description()
      : PersonPage();
  }
}