import 'package:dio/dio.dart';

import 'data/AllDataResponse.dart';

Future<List<AllDataResponse>?> allDataResponseApi() async {
  String getData =
      "https://scubetech.xyz/projects/dashboard/all-project-elements/";
  var dioClient = Dio();
  dioClient.options.headers['Accept'] = "application/json";
  dioClient.options.headers['content-Type'] = 'application/json';
  dioClient.options.headers['Access-Control-Allow-Origin'] = '*';
  dioClient.options.headers["X-Requested-With"] = "XMLHttpRequest";
  dioClient.options.headers['Access-Control-Allow-Credentials'] = true;
  dioClient.options.headers['Access-Control-Allow-Headers'] = {
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
  };
  dioClient.options.headers['Access-Control-Allow-Methods'] =
  "POST, GET, OPTIONS, PUT, DELETE, HEAD";
  try {
    final response = await dioClient.get(getData);
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      print(responseData);
      return responseData.map((json) => AllDataResponse.fromJson(json)).toList();
    }else{
      print(response.data);
    }
  } on DioException catch (e) {
    if("${e.type}" == "DioExceptionType.connectionError"){
      print("Your internet connection is unstable please re-check or try again later.");
    }
    print('DIO error allDataResponseApi: ${e.response}');
  }
}
Future<List<AllDataResponse>?> updateDataApi(id) async {
  String update =
      "https://scubetech.xyz/projects/dashboard/update-project-elements/$id/";
  var dioClient = Dio();
  dioClient.options.headers['Accept'] = "application/json";
  dioClient.options.headers['content-Type'] = 'application/json';
  dioClient.options.headers['Access-Control-Allow-Origin'] = '*';
  dioClient.options.headers["X-Requested-With"] = "XMLHttpRequest";
  dioClient.options.headers['Access-Control-Allow-Credentials'] = true;
  dioClient.options.headers['Access-Control-Allow-Headers'] = {
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
  };
  dioClient.options.headers['Access-Control-Allow-Methods'] =
  "POST, GET, OPTIONS, PUT, DELETE, HEAD";
  try {
    final response = await dioClient.get(update);
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      print(responseData);
      return responseData.map((json) => AllDataResponse.fromJson(json)).toList();
    }else{
      print(response.data);
    }
  } on DioException catch (e) {
    if("${e.type}" == "DioExceptionType.connectionError"){
      print("Your internet connection is unstable please re-check or try again later.");
    }
    print('DIO error allDataResponseApi: ${e.response}');
  }
}

Future<AllDataResponse?> addDataApi(Map<String, dynamic> values) async {
  String add =
      "https://scubetech.xyz/projects/dashboard/add-project-elements/";
  var dioClient = Dio();
  dioClient.options.headers['Accept'] = "application/json";
  dioClient.options.headers['content-Type'] = 'application/json';
  dioClient.options.headers['Access-Control-Allow-Origin'] = '*';
  dioClient.options.headers["X-Requested-With"] = "XMLHttpRequest";
  dioClient.options.headers['Access-Control-Allow-Credentials'] = true;
  dioClient.options.headers['Access-Control-Allow-Headers'] = {
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
  };
  dioClient.options.headers['Access-Control-Allow-Methods'] =
  "POST, GET, OPTIONS, PUT, DELETE, HEAD";
  try {
    final response = await dioClient.post(add,data: values);
    if(response.data["status_code"] == 201){
      return AllDataResponse.fromJson(response.data);
    }else{
      print(response.data["status"]);
    }
  } on DioException catch (e) {
    if("${e.type}" == "DioExceptionType.connectionError"){
      print("Your internet connection is unstable please re-check or try again later.");
    }
    print('DIO error allDataResponseApi: ${e.response}');
  }
}

