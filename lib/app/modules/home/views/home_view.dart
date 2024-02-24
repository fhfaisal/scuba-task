import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scuba_faisal/app/utils/utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Data"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // fetchData();
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => controller.navigateToUpdatePage(),
                      child: Card(
                          elevation: 5,
                          color: blueClr.withOpacity(0.5),
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: blueClr,
                                      child: Text(
                                        controller.allDataModel.value.id.toString(),
                                        style: const TextStyle(fontSize: 30, color: Colors.white),
                                      )),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: blueClr.withOpacity(0.9),
                                            borderRadius: const BorderRadius.only(
                                                topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                                        child: SingleChildScrollView(
                                          physics: const NeverScrollableScrollPhysics(),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(controller.projectNameController.text,
                                                  style: const TextStyle(fontSize: 18, color: Colors.white)),
                                              Text(controller.startDateController.text,
                                                  style: const TextStyle(fontSize: 14, color: Colors.white)),
                                              Text(controller.endDateController.text,
                                                  style: const TextStyle(fontSize: 14, color: Colors.white)),
                                              Text(controller.projectUpdateController.text,
                                                  style: const TextStyle(fontSize: 12, color: Colors.white)),
                                            ],
                                          ),
                                        ))),
                              ],
                            ),
                          )),
                    );
            },
          ),
        ),),
      floatingActionButton: InkWell(
          onTap: () => controller.navigateToAddPage(),
          child: Container(
              width: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Add Item',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ))),
    );
  }
}
