class EpisodeModel {
  int? status;
  String? message;
  List<EpisodeData>? episodeList;

  EpisodeModel({this.status, this.message, this.episodeList});

  EpisodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      episodeList = <EpisodeData>[];
      json['data'].forEach((v) {
        episodeList!.add(new EpisodeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.episodeList != null) {
      data['data'] = this.episodeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EpisodeData {
  String? title;
  String? image;
  String? description;
  String? audioOrVideo;
  double? duration;
  int? isMorning;
  int? isAfternoon;
  int? isNight;
  bool? isActive;
  String? sId;
  String? courseId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;

  EpisodeData(
      {this.title,
      this.image,
      this.description,
      this.audioOrVideo,
      this.duration,
      this.isMorning,
      this.isAfternoon,
      this.isNight,
      this.isActive,
      this.sId,
      this.courseId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.updatedBy});

  EpisodeData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
    audioOrVideo = json['audioOrVideo'];
    duration = json['duration'];
    isMorning = json['isMorning'];
    isAfternoon = json['isAfternoon'];
    isNight = json['isNight'];
    isActive = json['isActive'];
    sId = json['_id'];
    courseId = json['courseId'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['audioOrVideo'] = this.audioOrVideo;
    data['duration'] = this.duration;
    data['isMorning'] = this.isMorning;
    data['isAfternoon'] = this.isAfternoon;
    data['isNight'] = this.isNight;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['courseId'] = this.courseId;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}
