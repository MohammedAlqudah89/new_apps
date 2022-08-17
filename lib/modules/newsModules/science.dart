
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/News_App/cubit/cubit.dart';
import 'package:new_apps/layout/News_App/cubit/states.dart';
import 'package:new_apps/shared/component/default_component.dart';

class ScienceNews extends StatelessWidget
{
  const ScienceNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<CubitNews,StateNews>(
        listener: (context, state) {},
        builder: (context,state) {

          var list = CubitNews.get(context).science;

          return  newsConditionalBuilder (list,context);

          //newsListViewBuilder(articles);
        }
    );
  }

}