import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () => controller.datePicker(context, controller.startDateController),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                              Border.all(color: controller.startDateController.text.toString().isEmpty ? Colors.red : Color(0xff4446e9))),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => controller.datePicker(context, controller.startDateController),
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: controller.startDateController.text.toString().isEmpty ? Colors.red : Color(0xff4446e9),
                                ),
                              ),
                              Text(
                                controller.startDateController.text.toString().isEmpty
                                    ? 'Select start date'
                                    : controller.startDateController.text.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: controller.startDateController.text.toString().isEmpty ? Colors.red : Color(0xff4446e9),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(width: 20,),
                  Expanded(
                      child: InkWell(
                        onTap: () => controller.datePicker(context, controller.endDateController),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                              Border.all(color: controller.endDateController.text.toString().isEmpty ? Colors.red : Color(0xff4446e9))),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => controller.datePicker(context, controller.endDateController),
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: controller.endDateController.text.toString().isEmpty ? Colors.red : Color(0xff4446e9),
                                ),
                              ),
                              Text(
                                controller.endDateController.text.toString().isEmpty
                                    ? 'Select end date'
                                    : controller.endDateController.text.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: controller.endDateController.text.toString().isEmpty ? Colors.red : Color(0xff4446e9),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 16.0),
              CustomInputForm(labelText: 'Project Name',controller: controller.projectNameController,),
              CustomInputForm(labelText: 'Project Update',controller: controller.projectUpdateController,),
              CustomInputForm(labelText: 'Assigned Engineer',controller: controller.assignedEngineerController,),
              CustomInputForm(labelText: 'Assigned Technician',controller: controller.assignedTechnicianController,),
              CustomButton(buttonText: 'Add Data', onTap: () => controller.addProject())
            ],
          ),
        ),
      ),
    );
  }
}
