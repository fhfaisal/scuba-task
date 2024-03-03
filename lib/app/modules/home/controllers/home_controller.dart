import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scuba_faisal/app/routes/app_pages.dart';

import '../../../data/AllDataResponse.dart';
import '../../../repository.dart';

class HomeController extends GetxController {
  final RxList<AllDataResponse> allDataModel = RxList<AllDataResponse>();
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



  Future<AllDataResponse?> getAllData() async {
    await allDataResponseApi().then((response) {
      if(response != null){
        allDataModel.value = response;
      }
    });
    update();
  }

  navigateToAddPage(){
    Get.toNamed(Routes.ADD);
  }
  navigateToUpdatePage(index){
    Get.toNamed(Routes.UPDATE, arguments: allDataModel[index]);
  }
}
