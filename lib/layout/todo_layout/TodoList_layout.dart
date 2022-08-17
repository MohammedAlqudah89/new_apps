import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// import 'package:new_apps/modules/todolistmodules/archivedTasks_screen.dart';
// import 'package:new_apps/modules/todolistmodules/doneTasks_screen.dart';
// import 'package:new_apps/modules/todolistmodules/newTask_screen.dart';
// import 'package:new_apps/shared/component/constant.dart';
//import 'package:new_apps/shared/component/constant.dart';
import 'package:new_apps/shared/cubit/cubit.dart';
import 'package:new_apps/shared/cubit/states.dart';
// import 'package:sqflite/sqflite.dart';

class TodoListApp extends StatelessWidget {
  TodoListApp({Key? key}) : super(key: key);

  // key for button sheet layout
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  // @override
  // void initState() {
  //   super.initState();
  //   createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..createDatabase(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          TodoCubit cubit = TodoCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.title[cubit.cIndex],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                    // insertDatabase(
                    //   title: titleController.text,
                    //   time: timeController.text,
                    //   date: dateController.text,
                    // ).then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //     Navigator.pop(context);
                    //     // setState(() {
                    //     //   isBottomSheetShown = false;
                    //     //   fabIcon = Icons.edit;
                    //     //   tasks = value;
                    //     // });
                    //   });
                    // });
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet((context) => Container(
                            width: double.infinity,
                            color: Colors.grey[100],
                            padding: const EdgeInsets.all(10.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: titleController,
                                    decoration: const InputDecoration(
                                      labelText: 'Title',
                                      prefixIcon: Icon(Icons.title_outlined),
                                    ),

                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "title must be filled";
                                      }
                                      return null;
                                    },
                                  ),
                                  // defaultTextFormField1(
                                  //   onTap: () {
                                  //     print('title');
                                  //   },
                                  //   type: TextInputType.text,
                                  //   controller: titleController,
                                  //   prefix: Icons.title,
                                  //   validate: (value) {
                                  //     if (value!.isEmpty) {
                                  //       return 'enter a valid name';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   label: 'Title',
                                  // ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: timeController,
                                    decoration: const InputDecoration(
                                      labelText: 'Time',
                                      prefixIcon: Icon(Icons.timer),
                                    ),
                                    onTap: () {
                                      print('timing tabed');
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        timeController.text =
                                            (value?.format(context)).toString();
                                        print(value?.format(context));
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "time must be filled";
                                      }
                                      return null;
                                    },
                                  ),
                                  // defaultTextFormField1(
                                  //   type: TextInputType.text,
                                  //   controller: timeController,
                                  //   prefix: Icons.watch_later_outlined,
                                  //   onTap: () {
                                  //     print('timing tabed');
                                  //     showTimePicker(
                                  //       context: context,
                                  //       initialTime: TimeOfDay.now(),
                                  //     ).then((value) {
                                  //       timeController.text =
                                  //           (value?.format(context)).toString();
                                  //       print(value?.format(context));
                                  //     });
                                  //   },
                                  //   validate: (value) {
                                  //     if (value!.isEmpty) {
                                  //       return 'time must not be empty';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   label: 'Time',
                                  // ),
                                  const SizedBox(height: 15.0),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                      labelText: 'Calendar',
                                      prefixIcon: Icon(Icons.edit_calendar),
                                    ),
                                    onTap: () {
                                      print('calendar tabed');
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-08-01'),
                                      ).then((value) {
                                        print(value.toString());
                                        return dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Calendar must be filled";
                                      }
                                      return null;
                                    },
                                  ),

                                  // defaultTextFormField1(
                                  //   type: TextInputType.text,
                                  //   controller: dateController,
                                  //   prefix: Icons.edit_calendar,
                                  //   onTap: () {
                                  //     print('calendar tabed');
                                  //     showDatePicker(
                                  //       context: context,
                                  //       initialDate: DateTime.now(),
                                  //       firstDate: DateTime.now(),
                                  //       lastDate: DateTime.parse('2022-08-01'),
                                  //     ).then((value) {
                                  //       print(value.toString());
                                  //       return dateController.text =
                                  //           DateFormat.yMMMd().format(value!);
                                  //     });
                                  //   },
                                  //   validate: (value) {
                                  //     if ( value!.isEmpty) {
                                  //       return 'date must not be empty';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   label: 'Date',
                                  // )
                                ],
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetShown(
                        isShow: false, icon: Icons.edit);
                  });

                  cubit.changeBottomSheetShown(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.cIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context) => cubit.screens[cubit.cIndex],
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }

  // Future<String> getName() async {
  //   return 'Ahmed Ali';
  // }

}
