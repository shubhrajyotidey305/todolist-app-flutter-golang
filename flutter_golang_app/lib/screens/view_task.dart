import 'package:flutter/widgets.dart';
import 'package:flutter_golang_app/controllers/data_controller.dart';
import 'package:get/get.dart';

class ViewTask extends StatelessWidget {
  const ViewTask({super.key, required this.id});

  final int id;

  _loadSingleTask() async{
    await Get.find<DataController>().getSingleData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
