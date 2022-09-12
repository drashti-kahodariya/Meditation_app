class ExploreCourseModel {
  int? status;
  String? message;
  List<ExploreCourseData>? exploreCourseList;

  ExploreCourseModel({this.status, this.message, this.exploreCourseList});

  ExploreCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      exploreCourseList = <ExploreCourseData>[];
      json['data'].forEach((v) {
        exploreCourseList!.add(new ExploreCourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.exploreCourseList != null) {
      data['data'] = this.exploreCourseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExploreCourseData {
  String? sId;
  String? title;
  String? image;
  String? description;
  List<CourseData>? courseList;
  bool? isActive;
  String? categoryId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ExploreCourseData(
      {this.sId,
      this.title,
      this.image,
      this.description,
      this.courseList,
      this.isActive,
      this.categoryId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ExploreCourseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    if (json['courseList'] != null) {
      courseList = <CourseData>[];
      json['courseList'].forEach((v) {
        courseList!.add(new CourseData.fromJson(v));
      });
    }
    isActive = json['isActive'];
    categoryId = json['categoryId'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    if (this.courseList != null) {
      data['courseList'] = this.courseList!.map((v) => v.toJson()).toList();
    }
    data['isActive'] = this.isActive;
    data['categoryId'] = this.categoryId;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CourseData {
  String? sId;
  String? title;
  String? image;
  String? description;
  bool? isFavorite;

  CourseData(
      {this.sId, this.title, this.image, this.description, this.isFavorite});

  CourseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}
