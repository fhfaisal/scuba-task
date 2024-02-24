import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scuba_faisal/app/routes/app_pages.dart';

import '../../../data/AllDataResponse.dart';
import '../../../repository.dart';

class HomeController extends GetxController {
  final Rx<AllDataResponse> allDataModel = AllDataResponse().obs;
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final projectNameController = TextEditingController();
  final projectUpdateController = TextEditingController();
  final assignedEngineerController = TextEditingController();
  final assignedTechnicianController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    getAllData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void increment() => count.value++;



  Future<AllDataResponse?> getAllData() async {
    Map<String, dynamic> values = {};
    await allDataResponseApi(values).then((response) {
      if(response != null){
        allDataModel.value = response;
      }
    });
    update();
    return null;
  }

  navigateToAddPage(){
    Get.toNamed(Routes.ADD);
  }
  navigateToUpdatePage(){
    Get.toNamed(Routes.UPDATE,arguments: allDataModel.value.id);
  }
}
