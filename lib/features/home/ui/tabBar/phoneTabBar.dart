import "package:cart_app/features/home/ui/tabBar/tabListTile.dart";
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:cart_app/features/home/bloc/home_bloc.dart";

class PhoneTabBar extends StatefulWidget {
  const PhoneTabBar({super.key});

  @override
  State<PhoneTabBar> createState() => _PhoneTabBarState();
}

class _PhoneTabBarState extends State<PhoneTabBar> {
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
              return Center(child: CircularProgressIndicator());
            case HomeLoaddedSuccessState:
              final successState = state as HomeLoaddedSuccessState;
              final products = successState.products;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  // Convert the ID to an integer for comparison
                  final productId = int.tryParse(product.id);
                  if (productId != null && productId >= 11 && productId <= 20) {
                    return TabListTileWidget(
                        productModel: product, homeBloc: homeBloc);
                  } else {
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
        });
  }
}
