class FavouriteModel {
  int? status;
  String? message;
  List<FavouriteData>? favouriteList;

  FavouriteModel({this.status, this.message, this.favouriteList});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      favouriteList = <FavouriteData>[];
      json['data'].forEach((v) {
        favouriteList!.add(new FavouriteData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.favouriteList != null) {
      data['data'] = this.favouriteList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavouriteData {
  String? sId;
  Course? course;

  FavouriteData({this.sId, this.course});

  FavouriteData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}

class Course {
  String? sId;
  String? title;
  String? image;
  String? description;

  Course({this.sId, this.title, this.image, this.description});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
