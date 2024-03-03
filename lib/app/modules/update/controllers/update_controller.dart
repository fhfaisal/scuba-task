import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scuba_faisal/app/data/AllDataResponse.dart';
import 'package:scuba_faisal/app/repository.dart';

class UpdateController extends GetxController {
  final AllDataResponse allDataModel = Get.arguments;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectUpdateController = TextEditingController();
  final TextEditingController assignedEngineerController = TextEditingController();
  final TextEditingController assignedTechnicianController = TextEditingController();

  @override
  void onInit() {
    allDataModel;
    updateValue();
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
  Future<AllDataResponse?> updateProject() async {
    Map<String, dynamic> values = {
      "start_date": startDateController.text,
      "end_date": endDateController.text,
      "project_name": projectNameController.text,
      "project_update": projectUpdateController.text,
      "assigned_engineer": assignedEngineerController.text,
      "assigned_technician": assignedTechnicianController.text,
    };
    await updateDataApi(values).then((response) {
    });
    update();
  }


  updateValue() {
    startDateController.text = allDataModel.startDate.toString();
    endDateController.text = allDataModel.endDate.toString();
    projectNameController.text = allDataModel.projectName!;
    projectUpdateController.text = allDataModel.projectUpdate!;
    assignedEngineerController.text = allDataModel.assignedEngineer!;
    assignedTechnicianController.text = allDataModel.assignedTechnician!;
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
      print(formattedDate); //formatted date output using intl package =>  2021-03-16

      value.text = formattedDate; //set output date to TextField value.
      update();
    } else {}
  }
}
