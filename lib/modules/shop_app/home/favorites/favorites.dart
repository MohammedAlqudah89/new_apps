
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/shop_layout/cubit/cubit.dart';
import 'package:new_apps/layout/shop_layout/cubit/states.dart';
import 'package:new_apps/models/shop_model/favorites_model.dart';

import '../../../../models/shop_model/favorites_model.dart';



class ShopFavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state) {},
      builder: (context,state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesDataState,
          builder: (context) =>  ListView.separated(
              itemBuilder: (context,index) => favoritesBuilder(context, ShopCubit.get(context).getFavoritesModel.data!.data[index]),
              separatorBuilder: (context,index) => const Divider(),
              itemCount: ShopCubit.get(context).getFavoritesModel.data!.data.length),
          fallback: (context)=> const Center(child: CircularProgressIndicator()),
        );
      },

    );
  }

}

Widget favoritesBuilder (context, FavoriteData model) => Padding(
  padding: const EdgeInsets.all(16.0),
  child: Container(
    width: double.infinity,
    height: 150,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage('${model.product!.image}'),
              width: 150.0,
              height: 150.0,
            ),
            if(model.product!.discount !=0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: const Text('Discount',
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.white,
                    backgroundColor: Colors.red,
                  ),),
              ),
          ],

        ),
        const SizedBox( width: 5.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${model.product!.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  height: 1.1,
                ),
              ),
              Spacer(),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\$ ${model.product!.price} ',
                      style: const TextStyle(
                        fontSize: 12.0,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox( width: 5.0,),
                    if (model.product!.discount !=0)
                      Text(
                        '\$ ${model.product!.oldPrice}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                       IconButton(onPressed: ()
                         {
                                ShopCubit.get(context).changeFavorites(model.product!.id);
                        },
                         icon:
                         Icon(ShopCubit.get(context).favorite[model.product!.id]! ? FluentSystemIcons.ic_fluent_favorites_filled:FluentSystemIcons.ic_fluent_favorites_regular,
                         color: Colors.red,),),


                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    ),
  ),
);