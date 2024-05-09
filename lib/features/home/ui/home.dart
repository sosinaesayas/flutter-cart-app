
import "package:cart_app/features/home/ui/first_page.dart";
import "package:cart_app/features/home/ui/home_widgets.dart";
import "package:cart_app/features/home/ui/tabBar/tabBar.dart";

import 'package:flutter/material.dart';

import "package:cart_app/features/home/bloc/home_bloc.dart";


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  int selectedPage = 0;
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      // ProductsListPage(),
      FirstPage(homeBloc: homeBloc), 
      Text("Page  two"),
      Text("page three"),
      // TabBarWidget(homeBloc: HomeBloc()),
      Container()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 142, 142),
        title: Text("Yigzu Electronics"),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         homeBloc.add(HomeWishlistButtonNavigateEvent());
        //       },
        //       icon: Icon(Icons.favorite_border)),
        //   IconButton(
        //       onPressed: () {
        //         homeBloc.add(HomeCartButtonNavigateEvent());
        //       },
        //       icon: Icon(Icons.shopping_bag_outlined)),
        // ],
      ),
      body: pages[selectedPage],
      bottomNavigationBar: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPage = 0;
              });
            },
            child: Icon(Icons.home),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPage = 1;
              });
            },
            child: Icon(Icons.person),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPage = 2;
              });
            },
            child: Icon(Icons.phone),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPage = 0;
              });
            },
            child: Icon(Icons.tab),
          )
        ],
      ),
    );
  }
}
