import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_apps/layout/News_App/news_layout/news_app.dart';
import 'package:new_apps/layout/shop_layout/shop_layout.dart';
import 'package:new_apps/layout/todo_layout/TodoList_layout.dart';
import 'package:new_apps/modules/bmi_calculator/bmi_result/BMIResult_Screen.dart';
import 'package:new_apps/modules/counter/counterCubit_screen.dart';
import 'package:new_apps/modules/listview/Listview_Screen.dart';
import 'package:new_apps/modules/counter/counter_screen.dart';
import 'package:new_apps/modules/login/login_Screen.dart';
import 'package:new_apps/modules/listview/userModel_Screen.dart';
import 'package:new_apps/shared/bloc_observer.dart';
import 'package:new_apps/shared/component/constant.dart';
import 'package:new_apps/shared/cubit/cubit.dart';
import 'package:new_apps/shared/cubit/states.dart';
import 'package:new_apps/shared/network/local/cached_helper.dart';
import 'package:new_apps/shared/network/remote/dio_helper.dart';
import 'package:new_apps/shared/styles/themes.dart';
import 'layout/News_App/cubit/cubit.dart';
import 'layout/shop_layout/cubit/cubit.dart';
import 'modules/bmi_calculator/bmi_main/BMICalculator_Screen.dart';
import 'modules/home/HomeScreen.dart';
import 'modules/messenger/Messanger_Screen.dart';
import 'modules/shop_app/login/login_screen.dart';
import 'modules/shop_app/page_view/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachedHelper.init();
  Widget widget;
  bool? isDark= CachedHelper.getData(key: 'isDark') ;
  bool? onBoarding= CachedHelper.getData(key: 'onBoarding',);
  token = CachedHelper.getData(key: 'token',);
  if (onBoarding != null)
  {
    if (token != null) {
      widget = const ShopLayoutScreen();

    } else{ widget= ShopLoginScreen();}
  } else {
    widget = OnBoardingScreen();}

  BlocOverrides.runZoned(
        ()  {
          print(token);
      return  runApp(MyApp(isDark: isDark, startWidget: widget, ));

    },
    blocObserver: MyBlocObserver(),

  );
 // Bloc. = MyBlocObserver();

}

class MyApp extends StatelessWidget {

     bool? isDark;
    final Widget? startWidget;

    
    MyApp({this.isDark, this.startWidget,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:  [
       BlocProvider(create: (BuildContext context) => TodoCubit()..changeModeTheme(fromShared: isDark),),
      BlocProvider(create: (BuildContext context) => CubitNews()..getBusiness(),),
         BlocProvider(create: (BuildContext context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getUserDate(),
        ),
      ],

        child: BlocConsumer<TodoCubit,TodoStates>(
          listener: (context,state) {},
          builder: (context,state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              //Theme Sections
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: true? ThemeMode.light: ThemeMode.dark,
              // change the true value after fixing the theme mode ..
              //TodoCubit.get(context).isDark
              home: startWidget,
            );
          },

        ),
      );

  }
  }

