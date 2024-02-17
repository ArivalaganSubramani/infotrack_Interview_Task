import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  int vesselCnt;
  int boatownrCnt;
  int alertCnt;
  int userCnt;
  int crewCnt;
  int geoboundaryAlertCnt;
  int infoAlertCnt;
  String status;
  String message;

  Dashboard({
    required this.vesselCnt,
    required this.boatownrCnt,
    required this.alertCnt,
    required this.userCnt,
    required this.crewCnt,
    required this.geoboundaryAlertCnt,
    required this.infoAlertCnt,
    required this.status,
    required this.message,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    vesselCnt: json["vesselCnt"],
    boatownrCnt: json["boatownrCnt"],
    alertCnt: json["alertCnt"],
    userCnt: json["userCnt"],
    crewCnt: json["crewCnt"],
    geoboundaryAlertCnt: json["geoboundaryAlertCnt"],
    infoAlertCnt: json["infoAlertCnt"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "vesselCnt": vesselCnt,
    "boatownrCnt": boatownrCnt,
    "alertCnt": alertCnt,
    "userCnt": userCnt,
    "crewCnt": crewCnt,
    "geoboundaryAlertCnt": geoboundaryAlertCnt,
    "infoAlertCnt": infoAlertCnt,
    "status": status,
    "message": message,
  };
}
