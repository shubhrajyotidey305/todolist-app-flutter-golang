import 'package:flutter_golang_app/services/service.dart';
import 'package:flutter_golang_app/utils/app_constants.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data");
      update();
    } else {
      print("we failed");
    }
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.POST_TASKS, {
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      update();
      print("data post successful");
    } else {
      print("data post failed");
    }
  }

  Future<void> getSingleData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASK);
    if (response.statusCode == 200) {
      print("we got the data");
      update();
    } else {
      print("we failed");
    }
  }
}
