class GoogleLoginRequestModel {
  String? idToken;
  String? accessToken;
  String? deviceToken;

  GoogleLoginRequestModel({this.idToken, this.accessToken, this.deviceToken});

  GoogleLoginRequestModel.fromJson(Map<String, dynamic> json) {
    idToken = json['idToken'];
    accessToken = json['accessToken'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idToken'] = this.idToken;
    data['accessToken'] = this.accessToken;
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}
