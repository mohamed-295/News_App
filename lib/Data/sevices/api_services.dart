import 'package:dio/dio.dart';
import 'package:myapp/utils/app_constants.dart';

class ApiServices {
 static Dio? dio;
 static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

  }
 static  Future<Response> getData({
      required String url,
      required Map<String, dynamic> query,
    })
    async{
    return await  dio!.get(url, queryParameters: query);
    }
}
