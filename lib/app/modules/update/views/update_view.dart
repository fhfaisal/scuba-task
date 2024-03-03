import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  const UpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Project'),
        ),
        body:SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Project ID : ${controller.allDataModel.id}",
                  style: const TextStyle(fontStyle:FontStyle.italic,fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomInputForm(
                        labelText: 'Start Date',
                        controller: controller.startDateController,
                        prefixIcon: const Icon(Icons.calendar_today,color: blueClr,),
                        isReadOnly: true,
                        onTap: () => controller.datePicker(context, controller.startDateController),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: CustomInputForm(
                        labelText: 'End Date',
                        controller: controller.endDateController,
                        prefixIcon: const Icon(Icons.calendar_today,color: blueClr,),
                        isReadOnly: true,
                        onTap: () => controller.datePicker(context, controller.endDateController),
                      ),
                    ),
                  ],
                ),
                CustomInputForm(
                  labelText: 'Project Name',
                  controller: controller.projectNameController,
                ),
                CustomInputForm(
                  labelText: 'Project Update',
                  controller: controller.projectUpdateController,
                ),
                CustomInputForm(
                  labelText: 'Assigned Engineer',
                  controller: controller.assignedEngineerController,
                ),
                CustomInputForm(
                  labelText: 'Assigned Technician',
                  controller: controller.assignedTechnicianController,
                ),
                CustomButton(
                  buttonText: 'Update',
                  onTap: () => controller.updateProject(),
                )
              ],
            ),
          ),
        )
    );
  }
}