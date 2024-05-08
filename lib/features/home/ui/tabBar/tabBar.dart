import 'package:cart_app/features/home/ui/tabBar/pcTabBar.dart';
import 'package:cart_app/features/home/ui/tabBar/phoneTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_app/features/home/bloc/home_bloc.dart';
import 'package:cart_app/features/home/ui/tabBar/tvTabBar.dart';

class TabBarWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  const TabBarWidget({Key? key, required this.homeBloc}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'TV'),
              Tab(text: 'PC'),
              Tab(text: 'Phone'),
            ],
           
          ),
          Expanded(
            child: TabBarView(
              children: [
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
