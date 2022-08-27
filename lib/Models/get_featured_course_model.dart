class GetFeaturedCourseModel {
  int? status;
  String? message;
  FeaturedCourseData? featuredDataList;

  GetFeaturedCourseModel({this.status, this.message, this.featuredDataList});

  GetFeaturedCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    featuredDataList = json['data'] != null
        ? new FeaturedCourseData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.featuredDataList != null) {
      data['data'] = this.featuredDataList!.toJson();
    }
    return data;
  }
}

class FeaturedCourseData {
  List<CourseData>? courseData;
  State? state;

  FeaturedCourseData({this.courseData, this.state});

  FeaturedCourseData.fromJson(Map<String, dynamic> json) {
    if (json['course_data'] != null) {
      courseData = <CourseData>[];
      json['course_data'].forEach((v) {
        courseData!.add(new CourseData.fromJson(v));
      });
    }
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courseData != null) {
      data['course_data'] = this.courseData!.map((v) => v.toJson()).toList();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    return data;
  }
}

class CourseData {
  String? sId;
  String? title;
  String? image;
  String? description;
  bool? isActive;
  String? createdAt;
  bool? isFavorite;

  CourseData(
      {this.sId,
      this.title,
      this.image,
      this.description,
      this.isActive,
      this.createdAt,
      this.isFavorite});

  CourseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class State {
  int? page;
  int? limit;
  int? pageLimit;

  State({this.page, this.limit, this.pageLimit});

  State.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    pageLimit = json['page_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['page_limit'] = this.pageLimit;
    return data;
  }
}
