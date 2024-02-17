import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  int status;
  String token;
  String userid;
  String roleId;
  String loginAt;
  String tIdFormat;
  String latLonFormat;
  String distanceUnit;
  String windspeedUnit;
  String dateFormat;
  String loginId;
  String phoneNo;
  String emergencyContactNo;
  String emergencyContactPerson;
  String firstName;
  String lastName;
  String regionId;
  String centerId;
  String userProfileImage;
  String role;
  String sessionExpiryDateTime;
  String isSuperUser;
  String lastLoginDate;
  String createdOn;
  String createdBy;
  String trackingEnabled;
  String message;

  Login({
    required this.status,
    required this.token,
    required this.userid,
    required this.roleId,
    required this.loginAt,
    required this.tIdFormat,
    required this.latLonFormat,
    required this.distanceUnit,
    required this.windspeedUnit,
    required this.dateFormat,
    required this.loginId,
    required this.phoneNo,
    required this.emergencyContactNo,
    required this.emergencyContactPerson,
    required this.firstName,
    required this.lastName,
    required this.regionId,
    required this.centerId,
    required this.userProfileImage,
    required this.role,
    required this.sessionExpiryDateTime,
    required this.isSuperUser,
    required this.lastLoginDate,
    required this.createdOn,
    required this.createdBy,
    required this.trackingEnabled,
    required this.message,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    token: json["token"],
    userid: json["userid"],
    roleId: json["roleId"],
    loginAt: json["loginAt"],
    tIdFormat: json["tIDFormat"],
    latLonFormat: json["latLonFormat"],
    distanceUnit: json["distanceUnit"],
    windspeedUnit: json["windspeedUnit"],
    dateFormat: json["dateFormat"],
    loginId: json["LoginID"],
    phoneNo: json["PhoneNo"],
    emergencyContactNo: json["EmergencyContactNo"],
    emergencyContactPerson: json["EmergencyContactPerson"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    regionId: json["RegionId"],
    centerId: json["CenterId"],
    userProfileImage: json["UserProfileImage"],
    role: json["role"],
    sessionExpiryDateTime: json["SessionExpiryDateTime"],
    isSuperUser: json["IsSuperUser"],
    lastLoginDate: json["LastLoginDate"],
    createdOn: json["CreatedOn"],
    createdBy: json["CreatedBy"],
    trackingEnabled: json["TrackingEnabled"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "userid": userid,
    "roleId": roleId,
    "loginAt": loginAt,
    "tIDFormat": tIdFormat,
    "latLonFormat": latLonFormat,
    "distanceUnit": distanceUnit,
    "windspeedUnit": windspeedUnit,
    "dateFormat": dateFormat,
    "LoginID": loginId,
    "PhoneNo": phoneNo,
    "EmergencyContactNo": emergencyContactNo,
    "EmergencyContactPerson": emergencyContactPerson,
    "FirstName": firstName,
    "LastName": lastName,
    "RegionId": regionId,
    "CenterId": centerId,
    "UserProfileImage": userProfileImage,
    "role": role,
    "SessionExpiryDateTime": sessionExpiryDateTime,
    "IsSuperUser": isSuperUser,
    "LastLoginDate": lastLoginDate,
    "CreatedOn": createdOn,
    "CreatedBy": createdBy,
    "TrackingEnabled": trackingEnabled,
    "message": message,
  };
}
