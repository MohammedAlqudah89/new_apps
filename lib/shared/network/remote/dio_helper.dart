import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;


  // Static init for News Application
  //     static init()
  // {
  //   dio= Dio (
  //       BaseOptions(
  //         baseUrl: 'https://newsapi.org/',
  //         receiveDataWhenStatusError: true,
  //   ));
  // }


  //Static init () for Shop Application
      static init()
  {
    dio= Dio (
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
            // connectTimeout: 20 * 1000,
            // receiveTimeout: 20 * 1000,



    ));
  }

  // GET Dio Method

 static Future<Response> getData(
      {
  required String url,
           Map<String, dynamic>? query,
          String lang= 'en',
          String? token
}
) async
  {
    dio.options.headers=
      {
        'Content-Type' : 'application/json',
        'lang':lang,
        'Authorization': token??'',
      };

   return await dio.get(url);
  }


           // Post DIO Method

  static Future<Response> postDate(
      {
        required String url,
         Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang='en',
        String? token
      }
      ) async
  {
    dio.options.headers=  {
      'Content-Type' : 'application/json',
      'lang':lang,
      'Authorization': token??'',

    };
    return await dio.post(
        url,
        queryParameters: query,
        data:data,
    );
  }

  static Future<Response> putDate(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang='en',
        String? token
      }
      ) async
  {
    dio.options.headers=  {
      'Content-Type' : 'application/json',
      'lang':lang,
      'Authorization': token??'',

    };
    return await dio.put(
      url,
      queryParameters: query,
      data:data,
    );
  }
}