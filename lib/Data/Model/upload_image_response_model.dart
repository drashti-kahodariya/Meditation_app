class UploadImageResponseModel {
  int? status;
  String? message;
  ImageData? imageData;

  UploadImageResponseModel({this.status, this.message, this.imageData});

  UploadImageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    imageData = json['data'] != null ? ImageData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (imageData != null) {
      data['data'] = imageData!.toJson();
    }
    return data;
  }
}

class ImageData {
  String? image;

  ImageData({this.image});

  ImageData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}
