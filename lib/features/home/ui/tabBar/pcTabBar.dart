import "package:cart_app/features/home/ui/tabBar/tabListTile.dart";
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:cart_app/features/home/bloc/home_bloc.dart";


class PcTabBar extends StatefulWidget {
  const PcTabBar({super.key});

 @override
State<PcTabBar> createState() => _PcTabBarState();

}

class _PcTabBarState extends State<PcTabBar> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  int selectedPage = 0;
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        print(state);
        print("listening");
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
           return  Center(child: CircularProgressIndicator());
          case HomeLoaddedSuccessState:
            final successState = state as HomeLoaddedSuccessState;
            final products = successState.products;
            return ListView.builder(
  itemCount: products.length > 30 ? 10 : products.length,
  itemBuilder: (context, index) {
    // final productId = index + 1;
    // if (productId >= 21 && productId <= 30) {
    //   final productIndex = productId - 21; // Adjust index for products array
    //   final product = products[productIndex];
    //   return TabListTileWidget(productModel: product, homeBloc: homeBloc);
    // }

   
    if (index  >= 21 && index <= 30 ){
      final product = products[index];
      return TabListTileWidget(productModel: product, homeBloc: homeBloc);
    }
     else {
      return Container();
    }
    },
 
   
  
);

          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("error")),
            );
          default:
            return SizedBox();
        }
    
      }
      );
  }
}