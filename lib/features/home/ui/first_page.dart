import 'package:cart_app/features/home/ui/home_widgets.dart';
import 'package:cart_app/features/home/ui/tabBar/pcTabBar.dart';
import 'package:cart_app/features/home/ui/tabBar/phoneTabBar.dart';
import 'package:cart_app/features/home/ui/tabBar/tvTabBar.dart';
import 'package:flutter/material.dart';
import 'package:cart_app/features/home/bloc/home_bloc.dart';
import 'package:flutter/rendering.dart';

class FirstPage extends StatefulWidget {
  final HomeBloc homeBloc;
  const FirstPage({Key? key, required this.homeBloc}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yigzu Products"),
      ),
      // backgroundColor: const Color.fromARGB(255, 188, 217, 240),
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              tabs: [
                Material(                   
                  elevation:
                      4, // Adjust the elevation to control the shadow effect
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(24),
                     
                    ),
                    child: Tab(text: 'All'),
                  ),
                ),
                Material(                   
                  elevation:
                      4, // Adjust the elevation to control the shadow effect
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(24),
                     
                    ),
                    child: Tab(text: 'Tv'),
                  ),
                ),

                      Material(
                  elevation:
                      4, // Adjust the elevation to control the shadow effect
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 0.3),
                    ),
                    child: Tab(text: 'PC'),
                  ),
                ),

                      Material(
                  elevation:
                      4, // Adjust the elevation to control the shadow effect
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 0.3),
                    ),
                    child: Tab(text: 'Phone'),
                  ),
                ),
              ],
              indicatorColor: Colors.blue,
              
             
             
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductsListPage(),
                TvTabBar(),
                PcTabBar(),
                PhoneTabBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
