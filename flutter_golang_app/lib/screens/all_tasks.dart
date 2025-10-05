import 'package:flutter/material.dart';
import 'package:flutter_golang_app/utils/app_colors.dart';
import 'package:flutter_golang_app/controllers/data_controller.dart';
import 'package:flutter_golang_app/widgets/button_widget.dart';
import 'package:flutter_golang_app/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  Future<void> _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      initState: (_) {
        _loadData();
      },
      builder: (controller) {
        final myData = controller.myData;

        final leftEditIcon = Container(
          margin: EdgeInsets.only(bottom: 10),
          color: Color(0xff2e3253).withValues(alpha: 0.5),
          alignment: Alignment.centerLeft,
          child: Icon(Icons.edit, color: Colors.white),
        );

        final rightDeleteIcon = Container(
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.redAccent,
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, color: Colors.white),
        );

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 60),
                alignment: Alignment.topLeft,
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 3.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/header.jpg"),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, color: AppColors.secondaryColor),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Icon(Icons.home, color: AppColors.secondaryColor),
                    SizedBox(width: 10),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        color: Colors.black,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                    Spacer(),
                    Icon(
                      Icons.calendar_month_sharp,
                      color: AppColors.secondaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "2",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: leftEditIcon,
                      secondaryBackground: rightDeleteIcon,
                      onDismissed: (direction) {},
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 550,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                  color: Color(0xff2e3253).withValues(alpha: 0.4),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonWidget(
                                      backgroundColor: AppColors.mainColor,
                                      text: "View",
                                      textColor: Colors.white,
                                    ),
                                    SizedBox(height: 20),
                                    ButtonWidget(
                                      backgroundColor: AppColors.mainColor,
                                      text: "Edit",
                                      textColor: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                          return false;
                        } else {
                          return Future.delayed(
                            Duration(seconds: 1),
                            () => direction == DismissDirection.endToStart,
                          );
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: TaskWidget(
                          text: myData[index]['task_name'],
                          color: Colors.blueGrey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
