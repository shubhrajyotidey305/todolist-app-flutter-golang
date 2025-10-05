import 'package:flutter/material.dart';
import 'package:flutter_golang_app/utils/app_colors.dart';
import 'package:flutter_golang_app/controllers/data_controller.dart';
import 'package:flutter_golang_app/screens/all_tasks.dart';
import 'package:flutter_golang_app/widgets/button_widget.dart';
import 'package:flutter_golang_app/widgets/error_warning_msg.dart';
import 'package:flutter_golang_app/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool dataValidation() {
      if (nameController.text.trim() == '') {
        Message.taskErrorOrWarning("Task name", "You task name is empty");
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskErrorOrWarning("Task detail", "You task detail is empty");
        return false;
      }
      return true;
    }

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/addtask1.jpg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 40),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.secondaryColor),
                ),
              ],
            ),
            Column(
              children: [
                TextfieldWidget(
                  textEditingController: nameController,
                  hintText: "Task name",
                ),
                SizedBox(height: 20),
                TextfieldWidget(
                  maxLines: 3,
                  textEditingController: detailController,
                  hintText: "Task detail",
                  borderRadius: 15,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (dataValidation()) {
                      Get.find<DataController>().postData(
                        nameController.text.trim(),
                        detailController.text.trim(),
                      );
                      Get.to(
                        () => AllTask(),
                        transition: Transition.circularReveal,
                      );
                    }
                  },
                  child: ButtonWidget(
                    backgroundColor: AppColors.mainColor,
                    text: "Add",
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
          ],
        ),
      ),
    );
  }
}
