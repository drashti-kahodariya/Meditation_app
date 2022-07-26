class LoginSuccessResponseModel {
  int? status;
  String? message;
  UserData? userData;

  LoginSuccessResponseModel({this.status, this.message, this.userData});

  LoginSuccessResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? userType;
  int? loginType;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? image;
  String? token;
  String? refreshToken;
  bool? isUserPremium;
  UserData(
      {this.userType,
      this.loginType,
      this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.image,
      this.token,
      this.refreshToken,
      this.isUserPremium});

  UserData.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    loginType = json['loginType'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    image = json['image'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isUserPremium = json['isUserPremium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userType'] = userType;
    data['loginType'] = loginType;
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['image'] = image;
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    data['isUserPremium'] = isUserPremium;
    return data;
  }
}
