class ExploreModel {
  int? status;
  String? message;
  List<ExploreData>? exploreList;

  ExploreModel({this.status, this.message, this.exploreList});

  ExploreModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      exploreList = <ExploreData>[];
      json['data'].forEach((v) {
        exploreList!.add(new ExploreData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.exploreList != null) {
      data['data'] = this.exploreList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExploreData {
  String? name;
  String? sId;

  ExploreData({this.name, this.sId});

  ExploreData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['_id'] = this.sId;
    return data;
  }
}
