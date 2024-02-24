// To parse this JSON data, do
//
//     final allDataResponse = allDataResponseFromJson(jsonString);

import 'dart:convert';

List<AllDataResponse> allDataResponseFromJson(String str) => List<AllDataResponse>.from(json.decode(str).map((x) => AllDataResponse.fromJson(x)));

String allDataResponseToJson(List<AllDataResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllDataResponse {
  int? id;
  DateTime? startDate;
  DateTime? endDate;
  int? startDayOfYear;
  int? endDayOfYear;
  String? projectName;
  String? projectUpdate;
  String? assignedEngineer;
  String? assignedTechnician;
  int? duration;

  AllDataResponse({
    this.id,
    this.startDate,
    this.endDate,
    this.startDayOfYear,
    this.endDayOfYear,
    this.projectName,
    this.projectUpdate,
    this.assignedEngineer,
    this.assignedTechnician,
    this.duration,
  });

  factory AllDataResponse.fromJson(Map<String, dynamic> json) => AllDataResponse(
    id: json["id"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    startDayOfYear: json["start_day_of_year"],
    endDayOfYear: json["end_day_of_year"],
    projectName: json["project_name"],
    projectUpdate: json["project_update"],
    assignedEngineer: json["assigned_engineer"],
    assignedTechnician: json["assigned_technician"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "start_day_of_year": startDayOfYear,
    "end_day_of_year": endDayOfYear,
    "project_name": projectName,
    "project_update": projectUpdate,
    "assigned_engineer": assignedEngineer,
    "assigned_technician": assignedTechnician,
    "duration": duration,
  };
}
