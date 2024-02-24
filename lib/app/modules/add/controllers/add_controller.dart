import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scuba_faisal/app/repository.dart';

import '../../../data/AllDataResponse.dart';

class AddController extends GetxController {
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
    addProject();
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
      print(formattedDate); //formatted date output using intl package =>  2021-03-16
      value.text = formattedDate;
      update();
    } else {}
  }

  Future<AllDataResponse?> addProject() async {
    Map<String, dynamic> values = {};
    await addDataApi(values).then((response) {
      if(response != null){
        allDataModel.value = response;
      }
    });
    update();
    return null;
  }

}
