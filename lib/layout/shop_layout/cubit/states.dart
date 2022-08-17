

import '../../../models/shop_model/register_model.dart';
import '../../../models/shop_model/shop_user_model.dart';
import '../../../models/shop_model/user_data_setting_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {
  final String error;
  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoriesDataState extends ShopStates {}

class ShopErrorCategoriesDataState extends ShopStates {
  final String error;
  ShopErrorCategoriesDataState(this.error);
}

class ShopSuccessFavoritesDataState extends ShopStates {}

class ShopSuccessChangeFavoritesDataState extends ShopStates {}

class ShopErrorFavoriteDataState extends ShopStates {
  final String error;
  ShopErrorFavoriteDataState(this.error);
}

class ShopSuccessGetFavoritesDataState extends ShopStates {}

class ShopLoadingGetFavoritesDataState extends ShopStates {}

class ShopErrorGetFavoritesDataState extends ShopStates {
  final String error;
  ShopErrorGetFavoritesDataState(this.error);
}

class ShopLoadingGetUsersDataState extends ShopStates {}

class ShopSuccessGetUsersDataState extends ShopStates {
  late UserDataModel model;
  ShopSuccessGetUsersDataState(this.model);
}

class ShopErrorGetUsersDataState extends ShopStates {
  final String error;
  ShopErrorGetUsersDataState(this.error);
}

// register states

class ShopLoadingRegisterState extends ShopStates {}

class ShopSuccessRegisterState extends ShopStates {

  late RegisterModel model;
  ShopSuccessRegisterState(this.model);
}

class ShopErrorRegisterState extends ShopStates {
  final String error;
  ShopErrorRegisterState(this.error);
}

// Update state
class ShopUpdateUserLoadingState extends ShopStates {}

class ShopUpdateUserSuccessState extends ShopStates {
  final ShopLoginModel loginModel;
  ShopUpdateUserSuccessState(this.loginModel);
}

class ShopUpdateUserErrorState extends ShopStates {
  final String error;

  ShopUpdateUserErrorState(this.error);
}




// IconButton State

class ChangeIconButtonState extends ShopStates {}
