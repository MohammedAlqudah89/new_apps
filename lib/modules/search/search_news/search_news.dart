
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/News_App/cubit/cubit.dart';
import 'package:new_apps/layout/News_App/cubit/states.dart';
import 'package:new_apps/shared/component/default_component.dart';


class SearchNews extends StatelessWidget
{

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CubitNews,StateNews>(
        listener: (context, state) {},
        builder: (context,state) {
          var list= CubitNews.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children:
              [
                const Text('Search'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    validator: (value)
                    {
                      if (value!.isEmpty)
                      {
                        return 'Field must be filled';
                      }
                      return null;
                    },
                    onChanged: (value)
                    {
                      CubitNews.get(context).getSearch(value);
                    },
                    decoration:const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search,),
                    ),
                  ),
                ),
                Expanded(child: newsConditionalBuilder(list, context))
              ],
            ),

          );
        },);



  }
}