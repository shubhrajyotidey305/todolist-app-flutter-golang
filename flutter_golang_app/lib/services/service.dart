import 'package:flutter_golang_app/utils/app_constants.dart';
import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    Response response = await get(
      AppConstants.BASE_URL + uri,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    return response;
  }

  Future<Response> postData(String uri, dynamic body) async {
    Response response = await post(
      AppConstants.BASE_URL + uri,
      body,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    return response;
  }
}
