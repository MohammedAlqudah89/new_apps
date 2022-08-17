import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/layout/shop_layout/cubit/states.dart';
import 'package:new_apps/models/shop_model/favorites_model.dart';

import 'package:new_apps/modules/shop_app/home/categorise/categorise_shop.dart';
import 'package:new_apps/modules/shop_app/home/favorites/favorites.dart';
import 'package:new_apps/modules/shop_app/home/home/product_home.dart';
import 'package:new_apps/modules/shop_app/home/settings/shop_settings.dart';
import 'package:new_apps/shared/network/remote/dio_helper.dart';
import 'package:new_apps/shared/network/remote/end_points.dart';


import '../../../models/shop_model/categories_model.dart';
import '../../../models/shop_model/change_favorite_model.dart';
import '../../../models/shop_model/home_model.dart';
import '../../../models/shop_model/register_model.dart';
import '../../../models/shop_model/shop_user_model.dart';
import '../../../models/shop_model/user_data_setting_model.dart';
import '../../../shared/component/constant.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List <Widget> screens = [
    ShopProductHomeScreen(),
    ShopCategoriseScreen(),
    ShopFavoriteScreen(),
    ShopSettingsScreen(),

  ];

  void changeNavBar(index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

   HomeModel? homeUserModel;
   Map<int, bool> favorite = {};

  void getHomeData() {

    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: kHOME,
      token: token,
      ).then((value) {

      homeUserModel = HomeModel.fromJson(value.data);

     // printFullText(homeUserModel!.data.banners[0].image);
      //print(homeUserModel!.status);
      for (var e in homeUserModel!.data.products) {
        favorite.addAll({e.id: e.inFavorites});
      }
      print(favorite.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());


      emit(ShopErrorHomeDataState(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesData() {

    DioHelper.getData(
      url: GET_CATEGORIES,

    ).then((value) {

      categoriesModel = CategoriesModel.fromJson(value.data);

     // print(categoriesModel!.status);

      emit(ShopSuccessCategoriesDataState());
    }).catchError((error) {
      print(error.toString());

      emit(ShopErrorCategoriesDataState(error.toString()));
    });
  }


  ChangeFavoriteModel? favoriteModel;

  void changeFavorites(int productID)
  {
    favorite[productID]= !favorite[productID]!;

    emit(ShopSuccessChangeFavoritesDataState());

    DioHelper.postDate(url: kFAVORITES,
        data: {
          'product_id':productID,
        },
      token: token,
    ).then((value) {
      favoriteModel= ChangeFavoriteModel.fromJson(value.data);
      //print(value.data);

      // if the connection is disconnect by the server or the status is false
      if (!favoriteModel!.status)
        {
          favorite[productID]= !favorite[productID]!;
        }else {
        getFavoritesData();
      }

      emit(ShopSuccessFavoritesDataState());
    }).catchError((onError){
      favorite[productID]= !favorite[productID]!;
      emit(ShopErrorFavoriteDataState(onError.toString()));
    });
  }

   late FavoritesModel getFavoritesModel;
  void getFavoritesData() {

    emit(ShopLoadingGetFavoritesDataState());
    DioHelper.getData(
      url: kFAVORITES,
      token: token,

    ).then((value) {

      getFavoritesModel = FavoritesModel.fromJson(value.data);



      emit(ShopSuccessGetFavoritesDataState());
    }).catchError((error) {
      print(error.toString());

      emit(ShopErrorGetFavoritesDataState(error.toString()));
    });
  }



     UserDataModel? userSettingDataModel;

  void getUserDate ()
  {
    emit(ShopLoadingGetUsersDataState());
    DioHelper.getData(url: kPROFILE,
    token: token,
    ).then((value) {
      userSettingDataModel=UserDataModel.fromJason(value.data);
      emit(ShopSuccessGetUsersDataState(userSettingDataModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetUsersDataState(error));

    });
  }

  RegisterModel? registerModel;

  void postRegisterData ({required String name, required String phone, required String email, required String password})
  {
    emit(ShopLoadingRegisterState());

    DioHelper.postDate(url: kREGISTER,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel!.message);

    emit(ShopSuccessRegisterState(registerModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorRegisterState(error));
    });
  }

  late ShopLoginModel loginModel;
  void userUpdateData ({required String name, required String email, required String phone})
  {
    emit(ShopUpdateUserLoadingState());
    DioHelper.putDate(
        url: kUPDATE,
        data: {
          'name': name,
           'email' : email,
           'phone': phone,
    },
    token: token,
    ).then((value)
    {

      print(value.data);
      loginModel= ShopLoginModel.fromJason(value.data);

      emit(ShopUpdateUserSuccessState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopUpdateUserErrorState(error.toString()));

    }); // we bring the data from postman
  }


}



  //  IconData? icon= FluentSystemIcons.ic_fluent_favorites_regular;
  // bool isButtonShown = true;
  //
  // void changeIconButtonShown (context)
  // {
  //   if (isButtonShown) {
  //     icon = FluentSystemIcons.ic_fluent_favorites_filled;
  //     emit(ChangeIconButtonState());
  //   }
  //   isButtonShown=!isButtonShown;
  //   icon= FluentSystemIcons.ic_fluent_favorites_regular;
  //   emit(ChangeIconButtonState());
  // }







