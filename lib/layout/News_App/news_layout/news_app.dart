import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/News_App/cubit/cubit.dart';
import 'package:new_apps/layout/News_App/cubit/states.dart';
import 'package:new_apps/modules/search/search_news/search_news.dart';
import 'package:new_apps/shared/component/default_component.dart';
import 'package:new_apps/shared/cubit/cubit.dart';

class NewsApp extends StatelessWidget
{
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

//..getSport()..getScience(),

    return  BlocConsumer <CubitNews,StateNews>(
        listener: (context, state) {},
        builder: (context, state)
        {
          CubitNews cubit= CubitNews.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text(cubit.title[cubit.currentIndex]),
              actions: [
                IconButton(onPressed: ()
                {
                  navigateTo(context, SearchNews());
                },
                    icon: const Icon(Icons.search,)),
                IconButton(onPressed: ()
                {
                  TodoCubit.get(context).changeModeTheme();
                },
                    icon: const Icon(Icons.brightness_4_outlined,))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.buildBotNavBar,
               currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
            ),
            body: ConditionalBuilder
              (
              condition: true,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => const CircularProgressIndicator(),
            ),
          );
        },
      );
  }

}