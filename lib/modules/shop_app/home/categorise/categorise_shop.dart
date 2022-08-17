import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/models/shop_model/categories_model.dart';import '../../../../layout/shop_layout/cubit/cubit.dart';
import '../../../../layout/shop_layout/cubit/states.dart';

class ShopCategoriseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context,state) {
        return Scaffold(
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index) => categoryBuilder(ShopCubit.get(context).categoriesModel!.data.data[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: ShopCubit.get(context).categoriesModel!.data.data.length,)
        );
      },

    );
  }

  Widget categoryBuilder(DataModel model) =>  Row(

    children:
    [
      Image(image: NetworkImage(model.image),
        width: 120.0,
        height: 120.0,
      ),
      const SizedBox(width: 20.0,),
      Text(model.name,
        style: const TextStyle(
          fontSize: 18.0,
        ),),
      const Spacer(),
      const Icon(Icons.arrow_forward_outlined,
        size: 40.0,)
    ],
  );

}