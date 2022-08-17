
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/News_App/cubit/states.dart';
import 'package:new_apps/modules/newsModules/business.dart';
import 'package:new_apps/modules/newsModules/science.dart';
import 'package:new_apps/modules/newsModules/sports.dart';
import 'package:new_apps/shared/network/remote/dio_helper.dart';



class CubitNews extends Cubit<StateNews>
{
  CubitNews():super(NewsInitialState());

  static CubitNews get(context) => BlocProvider.of(context);

  List<Widget> screens=
  [
    const  BusinessNews(),
    const SportNews(),
    const ScienceNews(),
    // SettingNews(),
  ];

  List <String> title =
  [
    'Business News',
    'Sport News',
    'Science News',
    // 'Setting'
  ];
  List <BottomNavigationBarItem> buildBotNavBar =
   const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center_rounded,),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports,),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science,),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.settings,),
    //   label: 'Setting',
    // ),
  ];

  int currentIndex= 0;

 void changeIndex (index)
 {
   currentIndex= index;
   if (index == 1) {
     getSport();
   }
   if (index == 2) {
     getScience();
   }
   emit(ChangeNewsNavBarState());
 }

 List <dynamic> business = [];

 void getBusiness ()
 {
   emit(NewsGetBusinessLoadingState());
   if (business.isEmpty)
     {
       DioHelper.getData(
           url: 'v2/top-headlines',
           query: {
             'country':'eg',
             'category' : 'business',
             'apiKey' : '184440a6b5ad42b593959dc5ae981113',
           }
       ).then((value)
       {
         business = value.data['articles'];
         //print(business[0]['title']);
         emit(NewsGetBusinessSuccessStates());
       }).catchError((error)
       {
         print(error.toString());
         emit(NewsGetBusinessErrorStates(error.toString()));
       });
     }
   else
   {
     emit(NewsGetBusinessSuccessStates());
   }

 }

 List<dynamic> sport = [];

  void getSport ()
  {
    emit(NewsGetSportsLoadingState());
    if (sport.isEmpty)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category' : 'sports',
              'apiKey' : '184440a6b5ad42b593959dc5ae981113',
            }
        ).then((value)
        {
          sport = value.data['articles'];
          //print(sport[0]['title']);
          emit(NewsGetSportsSuccessStates());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetSportsErrorStates(error.toString()));
        });
      } else
        {
          emit(NewsGetSportsSuccessStates());
        }

  }

  List<dynamic> science = [];

  void getScience () {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '184440a6b5ad42b593959dc5ae981113',
          }
      ).then((value) {
        science = value.data['articles'];
        //print(sport[0]['title']);
        emit(NewsGetScienceSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorStates(error.toString()));
      });
    } else
    {
      emit(NewsGetScienceSuccessStates());
    }
  }

  late List<dynamic> search = [];

  void getSearch (String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': value,
          'apiKey': '184440a6b5ad42b593959dc5ae981113',
        }
    ).then((value) {
      search = value.data['articles'];
     // print(search[0]['url']);
      emit(NewsGetSearchSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorStates(error.toString()));
    });
  }
}



