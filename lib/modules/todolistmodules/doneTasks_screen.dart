import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/shared/component/constant.dart';
import 'package:new_apps/shared/component/default_component.dart';
import 'package:new_apps/shared/cubit/cubit.dart';
import 'package:new_apps/shared/cubit/states.dart';

class DoneTaskScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return   BlocConsumer <TodoCubit, TodoStates>(

      listener: (context,state){},
      builder: (context,state){
        var tasks= TodoCubit.get(context).doneTasks;
        TodoCubit cubit= TodoCubit.get(context);
        return taskBuilder(
          tasks: tasks,
        );
      },

    );

  }

}