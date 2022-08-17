//API Search
// https://newsapi.org/v2/everything?q=Apple&apiKey=184440a6b5ad42b593959dc5ae981113

import '../../modules/shop_app/login/login_screen.dart';
import '../network/local/cached_helper.dart';
import 'default_component.dart';

void signOut(context)
{
  CachedHelper.removeDate(key: 'token').then((value)
  {
    if (value)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }

  });
}


void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token;