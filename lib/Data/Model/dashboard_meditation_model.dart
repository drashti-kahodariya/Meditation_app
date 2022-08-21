class DashboardMeditationModel {
  int? status;
  String? message;
  List<DashboardData>? dashboardList;

  DashboardMeditationModel({this.status, this.message, this.dashboardList});

  DashboardMeditationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      dashboardList = <DashboardData>[];
      json['data'].forEach((v) {
        dashboardList!.add(new DashboardData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dashboardList != null) {
      data['data'] = this.dashboardList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashboardData {
  List<StartYourDay>? startYourDay;
  List<StartYourDay>? afternoonLift;
  List<StartYourDay>? atNight;

  DashboardData({this.startYourDay, this.afternoonLift, this.atNight});

  DashboardData.fromJson(Map<String, dynamic> json) {
    if (json['startYourDay'] != null) {
      startYourDay = <StartYourDay>[];
      json['startYourDay'].forEach((v) {
        startYourDay!.add(new StartYourDay.fromJson(v));
      });
    }
    if (json['afternoonLift'] != null) {
      afternoonLift = <StartYourDay>[];
      json['afternoonLift'].forEach((v) {
        afternoonLift!.add(new StartYourDay.fromJson(v));
      });
    }
    if (json['atNight'] != null) {
      atNight = <StartYourDay>[];
      json['atNight'].forEach((v) {
        atNight!.add(new StartYourDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.startYourDay != null) {
      data['startYourDay'] = this.startYourDay!.map((v) => v.toJson()).toList();
    }
    if (this.afternoonLift != null) {
      data['afternoonLift'] =
          this.afternoonLift!.map((v) => v.toJson()).toList();
    }
    if (this.atNight != null) {
      data['atNight'] = this.atNight!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StartYourDay {
  String? sId;
  String? title;
  String? image;
  String? description;
  String? audioOrVideo;

  StartYourDay(
      {this.sId, this.title, this.image, this.description, this.audioOrVideo});

  StartYourDay.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    audioOrVideo = json['audioOrVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['audioOrVideo'] = this.audioOrVideo;
    return data;
  }
}
