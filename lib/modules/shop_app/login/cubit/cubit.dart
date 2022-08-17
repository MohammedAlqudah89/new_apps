import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/models/shop_model/shop_user_model.dart';
import 'package:new_apps/modules/shop_app/login/cubit/states.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {

  ShopLoginCubit() : super(ShopLoginInitializedStates());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

    late ShopLoginModel loginModel;

  void userLogin ({required String email, required String password,})
  {
    emit(ShopUserLoginLoadingState());
    DioHelper.postDate(url: LOGIN, data: {
      'email' : email,
      'password': password,
    }).then((value)
    {

      print(value.data);
      loginModel= ShopLoginModel.fromJason(value.data);

      emit(ShopSuccessUserLoginState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorUserLoginState(error.toString()));

    }); // we bring the data from postman
  }

   bool isPassword = true;
   IconData suffix= Icons.visibility_off;

   void changeSuffixVisibility ()
   {
     isPassword= !isPassword;
     isPassword? suffix= Icons.visibility_off : suffix= Icons.remove_red_eye;
     emit(ShopChangeIconVisibilityState());
   }
}