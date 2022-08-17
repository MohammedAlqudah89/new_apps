import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/shop_layout/cubit/cubit.dart';
import 'package:new_apps/layout/shop_layout/cubit/states.dart';
import 'package:new_apps/models/shop_model/categories_model.dart';

import '../../../../models/shop_model/home_model.dart';
import '../../../../shared/component/default_component.dart';


class ShopProductHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer <ShopCubit,ShopStates>(
      listener: (context,state) {} ,
      builder: (context,state) {

        return Scaffold(

          body: ConditionalBuilder(
            condition: ShopCubit.get(context).homeUserModel != null && ShopCubit.get(context).categoriesModel != null,
            builder: (context) => shopBuilder( ShopCubit.get(context).homeUserModel!, ShopCubit.get(context).categoriesModel!, context),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          ),
        );
      },

    );
  }
  Widget shopBuilder (HomeModel model,  CategoriesModel categoriesModel, context)
  {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(

        children: [
          CarouselSlider(
              items: model.data.banners.map((e) => 
              Image(image: NetworkImage(e.image),
              width: double.infinity,
                fit: BoxFit.cover,
              ),
              ).toList(),

              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2,),
                autoPlayAnimationDuration: const Duration(seconds: 1,),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction:1.0,
              )
          ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Categories',
                style: TextStyle(
                  fontSize: 25.0,
                ),),
                const SizedBox(height: 10.0,),
                Container(
                  height: 100.0,
                  child: ListView.separated(
                    physics:const BouncingScrollPhysics(),
                     scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index) => categoriesListviewBuilder(categoriesModel.data.data[index]),
                      separatorBuilder: (context,index) => const SizedBox(width: 10.0,),
                      itemCount: categoriesModel.data.data.length),
                ),
                const SizedBox(height: 20.0,),
                const Text('New Products',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 1/1.7,
                crossAxisCount: 2,
            children: List.generate(model.data.products.length, (index) => builderGridProduct(model.data.products[index], context))
            ),
          )
        ],
      ),
    );
  }

  Widget builderGridProduct (ProductModel model, context) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(model.image),
              width: double.infinity,
              height: 200.0,
            ),
            if(model.discount !=0)
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
        const SizedBox(height: 3.0,),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  height: 1.1,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$ ${model.price}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox( width: 5.0,),
                  if (model.discount !=0)
                    Text(
                    '\$ ${model.oldPrice}',
                    style: const TextStyle(
                      fontSize: 10.0,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                   const Spacer(),
                  IconButton(onPressed: (){
                    ShopCubit.get(context).changeFavorites(model.id);
                    },
                      icon:Icon(ShopCubit.get(context).favorite[model.id]! ? FluentSystemIcons.ic_fluent_favorites_filled:FluentSystemIcons.ic_fluent_favorites_regular,
                        color: Colors.red,
                      ),

                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget categoriesListviewBuilder (DataModel model) => Stack(
    alignment: AlignmentDirectional.topCenter,
    children: [
      Image(image: NetworkImage(model.image ),
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,),
      Container(
        color:Colors.black54.withOpacity(0.6),
        width: 100.0,
        child: Text(model.name,
          textAlign: TextAlign.center,
          style:const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),),
      ),
    ],

  );

}