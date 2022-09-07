import 'package:meditation_app/Data/Model/episode_model.dart';

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
        if (v is Map<String, dynamic>) {
          dashboardList!.add(DashboardData.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (dashboardList != null) {
      data['data'] = dashboardList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashboardData {
  List<EpisodeData>? startYourDay;
  List<EpisodeData>? afternoonLift;
  List<EpisodeData>? atNight;

  DashboardData({this.startYourDay, this.afternoonLift, this.atNight});

  DashboardData.fromJson(Map<String, dynamic> json) {
    if (json['startYourDay'] != null) {
      startYourDay = <EpisodeData>[];
      json['startYourDay'].forEach((v) {
        startYourDay!.add(new EpisodeData.fromJson(v));
      });
    }
    if (json['afternoonLift'] != null) {
      afternoonLift = <EpisodeData>[];
      json['afternoonLift'].forEach((v) {
        afternoonLift!.add(new EpisodeData.fromJson(v));
      });
    }
    if (json['atNight'] != null) {
      atNight = <EpisodeData>[];
      json['atNight'].forEach((v) {
        atNight!.add(new EpisodeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.startYourDay != null) {
      data['startYourDay'] = this.startYourDay!.map((v) => v.toJson()).toList();
    }
    if (afternoonLift != null) {
      data['afternoonLift'] =
          this.afternoonLift!.map((v) => v.toJson()).toList();
    }
    if (this.atNight != null) {
      data['atNight'] = this.atNight!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
