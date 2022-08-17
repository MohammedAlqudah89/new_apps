// import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/modules/todolistmodules/archivedTasks_screen.dart';
import 'package:new_apps/modules/todolistmodules/doneTasks_screen.dart';
import 'package:new_apps/modules/todolistmodules/newTask_screen.dart';
import 'package:new_apps/shared/cubit/states.dart';
import 'package:new_apps/shared/network/local/cached_helper.dart';
import 'package:sqflite/sqflite.dart';

class TodoCubit extends Cubit<TodoStates>
{
  TodoCubit():super(AppBarInitialState());


  static TodoCubit get(context) => BlocProvider.of(context);
  int cIndex = 0;

  List<Widget> screens = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen(),
  ];
  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex (int index)
  {
    cIndex = index;
    emit(AppBarChangeNavBarState());
  }

  // Database section

  late Database database;
  late List<Map> newTasks = [];
  late List<Map> doneTasks = [];
  late List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        // id integer
        // title String
        // date String
        // time String
        // status String

        print('database created');
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

// creating a result variable in order to return non null label value
   insertDatabase(
      {required String title,
        required String time,
        required String date}) async {
     await database.transaction((txn) {
      var result = txn
          .rawInsert(
          'INSERT INTO tasks (title,date,time, status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);

      }).catchError((error) {
        print("error when inserted ${error.toString()}");
      });
      return result;
    });

     }


     // Theme Toggle for News app

     bool isDark =true;

  changeModeTheme ({bool? fromShared})
  {
    if (fromShared != null)
      {
        isDark=fromShared;
        emit(ChangeModeThemeState());
      } else {
      isDark=!isDark;
      CachedHelper.putData(key: 'isDark', value: isDark)
          .then((value)
      {
        emit(ChangeModeThemeState());
      }
      );
    }


  }



void getDataFromDatabase(database)
{


 // emit(AppGetDatabaseLoadingState());

  database.rawQuery('SELECT * FROM tasks').then((value) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    value.forEach((element)
    {
      if(element['status'] == 'new') {
        newTasks.add(element);
      } else if(element['status'] == 'done') {
        doneTasks.add(element);
      } else {
        archivedTasks.add(element);
      }
    });

    emit(AppGetDatabaseState());
  });
}

void updateDate({
  required String status,
  required int id,
}) async
{
  database.rawUpdate(
    'UPDATE tasks SET status = ? WHERE id = ?',
    ['$status', id],
  ).then((value)
  {
    getDataFromDatabase(database);
    emit(GetUpdateFromDatabase());
  });
}

  void deleteDate({
    required int id,
  }) async
  {
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }


  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

void changeBottomSheetShown({
  required bool isShow,
  required IconData icon,
}) {
  isBottomSheetShown = isShow;
  fabIcon = icon;

  emit(ChangeBottomSheetState());
}


}