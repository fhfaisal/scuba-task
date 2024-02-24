import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scuba_faisal/app/data/AllDataResponse.dart';

import '../../../repository.dart';

class UpdateController extends GetxController {
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
    update();
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

  updateValue() {
    startDateController.text = allDataModel.value.startDate.toString();
    endDateController.text = allDataModel.value.startDate.toString();
    projectNameController.text = allDataModel.value.projectName!;
    projectUpdateController.text = allDataModel.value.projectUpdate!;
    assignedEngineerController.text = allDataModel.value.assignedEngineer!;
    assignedTechnicianController.text = allDataModel.value.assignedTechnician!;
    update();
  }
  datePicker(BuildContext context, var value) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);
        value.text = formattedDate;
        update();
    } else {}
  }
  Future<AllDataResponse?> updateProject() async {
    Map<String, dynamic> values = {};
    await updateDataApi(values,allDataModel.value.id).then((response) {
      if(response != null){
        allDataModel.value = response;
      }
    });
    update();
  }

}
