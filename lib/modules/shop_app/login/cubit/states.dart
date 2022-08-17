import '../../../../models/shop_model/shop_user_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitializedStates extends ShopLoginStates {}

class ShopUserLoginLoadingState extends ShopLoginStates {}

class ShopSuccessUserLoginState extends ShopLoginStates {
   final ShopLoginModel loginModel;
  ShopSuccessUserLoginState(this.loginModel);
}

class ShopErrorUserLoginState extends ShopLoginStates {
  final String error;

  ShopErrorUserLoginState(this.error);
}

class ShopChangeIconVisibilityState extends ShopLoginStates {}