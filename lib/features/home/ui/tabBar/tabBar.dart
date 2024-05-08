import 'package:cart_app/features/home/ui/tabBar/pcTabBar.dart';
import 'package:cart_app/features/home/ui/tabBar/phoneTabBar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cart_app/features/home/bloc/home_bloc.dart';
import 'package:cart_app/features/home/ui/tabBar/tvTabBar.dart';

// class TabBarWidget extends StatelessWidget {
//   final HomeBloc homeBloc;
//   const TabBarWidget({Key? key, required this.homeBloc}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Column(
//         children: [
//           TabBar(
//             tabs: [
//               Tab(text: 'TV'),
//               Tab(text: 'PC'),
//               Tab(text: 'Phone'),
//             ],
           
//           ),
//           Expanded(
//             child: TabBarView(
//               children: [
//                TvTabBar(),
//                PcTabBar(),
//                PhoneTabBar(),
                
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class TabBarWidget extends StatefulWidget {
  final HomeBloc homeBloc;
  const TabBarWidget({Key? key, required this.homeBloc}) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'TV'),
              Tab(text: 'PC'),
              Tab(text: 'Phone'),
            ],
            labelColor: Colors.white, // Color for selected tab label
            unselectedLabelColor: Colors.grey, // Color for unselected tab labels
            indicatorColor: Colors.white, // Color for tab selection indicator
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
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
