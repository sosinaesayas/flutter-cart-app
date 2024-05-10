
import "package:cart_app/features/cart/ui/cart.dart";
import "package:cart_app/features/home/ui/first_page.dart";
import "package:cart_app/features/home/ui/home_widgets.dart";
import "package:cart_app/features/home/ui/tabBar/tabBar.dart";
import "package:cart_app/features/wishlist/ui/wishlist.dart";

import 'package:flutter/material.dart';

import "package:cart_app/features/home/bloc/home_bloc.dart";


// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   int selectedPage = 0;
//   final HomeBloc homeBloc = HomeBloc();
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> pages = [
//       FirstPage(homeBloc: homeBloc),
//       Wishlist(),
//       Cart(),
//       Container()
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 247, 142, 142),
//         title: Text("Yigzu Electronics"),
       
//       ),
//       body: pages[selectedPage],
//       bottomNavigationBar: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedPage = 0;
//               });
//             },
//             child: Icon(Icons.home_outlined),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedPage = 1;
//               });
//             },
//             child: Icon(Icons.favorite_border),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedPage = 2;
//               });
//             },
//             child: Icon(Icons.shopping_bag_outlined),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedPage = 3;
//               });
//             },
//             child: Icon(Icons.person_outlined),
//           )
//         ],
//       ),
//     );
//   }
// }
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
    List<Widget> pages = [
      FirstPage(homeBloc: homeBloc),
      Wishlist(),
      Cart(),
      Container()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 249, 249),
        
        // shadowColor:Color.fromARGB(239, 254, 233, 233),
        title: Text("Yigzu Electronics",
        ),
      ),
      body: pages[selectedPage],
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
    );
  }
}
