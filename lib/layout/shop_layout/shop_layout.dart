import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/shop_layout/cubit/cubit.dart';
import 'package:new_apps/layout/shop_layout/cubit/states.dart';


import '../../shared/component/constant.dart';

class ShopLayoutScreen extends StatelessWidget
{
  const ShopLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state) {},
      builder: (context,state) {
        ShopCubit cubit= ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: const Text('Shop'),
            actions: [
              TextButton(onPressed: () {
                signOut(context);

              },
                  child: const Text('SIGN-OUT')),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),  label:'Home' ),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label:'Categorise' ),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label:'Favorite' ),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        //  showSelectedLabels: true,
          currentIndex: cubit.currentIndex,
            onTap: (index) {
            cubit.changeNavBar(index);
            },
          ),


        );
      },
    );
  }

}