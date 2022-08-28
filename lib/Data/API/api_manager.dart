import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meditation_app/Data/API/api_exception.dart';
import 'package:meditation_app/Models/error_model.dart';
import 'package:meditation_app/Models/login_success_response_model.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';

class APIManager {
  ///
  ///base URL
  ///
  static const baseUrl = "https://api.sinnesmeditation.com/";

  /// Used to call post API method, pass the url and param for api call
  ///
  /// `APIManager().postAPICall("https://.....",{});`
  Future<dynamic> postAPICall(String url, Map param) async {
    print("Calling API: ${baseUrl + url}");
    print("Calling parameters: $param");

    var responseJson;
    try {
      /// Show progress loader
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      /// Set header for send request
      var headers = GetStorage().read(AppPreferencesHelper.pUser) == null
          ? {
              "Content-Type": "application/json",
            }
          : {
              "Content-Type": "application/json",
              "Authorization": UserData.fromJson(
                      GetStorage().read(AppPreferencesHelper.pUser))
                  .token!
            };

      /// call post api for given url and parameters
      final response = await http
          .post(Uri.parse(baseUrl + url),
              headers: headers, body: json.encode(param))
          .timeout(const Duration(seconds: 10));
      // .onError((error, stackTrace) =>
      //     throw FetchDataException('Something Went Wrong!'));
      if (kDebugMode) {
        print(response.body);
      }

      /// Check api response and handle exception
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } finally {
      /// Hide progress loader
      EasyLoading.dismiss();
    }
    return responseJson;
  }

  /// Used to call get API method, pass the url for api call
  ///
  /// `APIManager().getAPICall("https://.....");`
  Future<dynamic> getAPICall(String url, {bool isLoaderShow = true}) async {
    print("Calling API: $url");

    var responseJson;
    try {
      /// Show progress loader
      ///
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      var headers = GetStorage().read(AppPreferencesHelper.pUser) == null
          ? {
              "Content-Type": "application/json",
            }
          : {
              "Content-Type": "application/json",
              "Authorization": UserData.fromJson(
                      GetStorage().read(AppPreferencesHelper.pUser))
                  .token!
            };
      Get.printInfo(info: 'header- ${headers.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');

      /// call post api for given url and parameters
      final response = await http
          .get(Uri.parse(baseUrl + url), headers: headers)
          .timeout(Duration(seconds: 15));
      // .onError((error, stackTrace) =>
      //     throw FetchDataException('Something went wrong!'));
      print("HEllo:: ${response.body}");
      if (kDebugMode) {
        print(response.body);
      }

      /// Check api response and handle exception
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } finally {
      /// Hide progress loader
      if (isLoaderShow) {
        EasyLoading.dismiss();
      }
    }
    return responseJson;
  }

  /// Used to call post API method, pass the url and param for api call
  ///
  /// `APIManager().patchAPICall("https://.....",{});`
  Future<dynamic> patchAPICall(String url, Map param) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      /// Show progress loader
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      /// Set header for send request
      var headers = GetStorage().read(AppPreferencesHelper.pUser) == null
          ? {
              "Content-Type": "application/json",
            }
          : {
              "Content-Type": "application/json",
              "Authorization": UserData.fromJson(
                      GetStorage().read(AppPreferencesHelper.pUser))
                  .token!
            };
      print("Headers:${headers}");

      /// call post api for given url and parameters
      final response = await http
          .patch(Uri.parse(baseUrl + url),
              headers: headers, body: json.encode(param))
          .timeout(Duration(seconds: 15));
      // .onError((error, stackTrace) =>
      //     throw FetchDataException('Something went wrong!'));
      print("response: ${response.body}");

      /// Check api response and handle exception
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } finally {
      /// Hide progress loader
      EasyLoading.dismiss();
    }
    return responseJson;
  }

  /// Used to call post API method, pass the url and param for api call
  ///
  /// `APIManager().postAPICall("https://.....",{});`
  Future<dynamic> putAPICall(String url, Map param) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      /// Show progress loader
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      /// Set header for send request
      var headers = GetStorage().read(AppPreferencesHelper.pUser) == null
          ? {
              "Content-Type": "application/json",
            }
          : {
              "Content-Type": "application/json",
              "Authorization": UserData.fromJson(
                      GetStorage().read(AppPreferencesHelper.pUser))
                  .token!
            };

      /// call post api for given url and parameters
      final response = await http
          .put(Uri.parse(baseUrl + url),
              headers: headers, body: json.encode(param))
          .timeout(Duration(seconds: 15));
      // .onError((error, stackTrace) =>
      //     throw FetchDataException('Something went wrong!'));

      /// Check api response and handle exception
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } finally {
      /// Hide progress loader
      EasyLoading.dismiss();
    }
    return responseJson;
  }

  /// Used to call delete API method, pass the url and param for api call
  ///
  /// `APIManager().deleteAPICall("https://.....",{});`
  Future<dynamic> deleteAPICall(String url, Map param) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      /// Show progress loader
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      /// Set header for send request
      var headers = GetStorage().read(AppPreferencesHelper.pUser) == null
          ? {
              "Content-Type": "application/json",
            }
          : {
              "Content-Type": "application/json",
              "Authorization": UserData.fromJson(
                      GetStorage().read(AppPreferencesHelper.pUser))
                  .token!
            };

      /// call post api for given url and parameters
      final response = await http
          .delete(Uri.parse(baseUrl + url),
              headers: headers, body: json.encode(param))
          .timeout(Duration(seconds: 15));
      // .onError((error, stackTrace) =>
      //     throw FetchDataException('Something went wrong!'));

      /// Check api response and handle exception
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } finally {
      /// Hide progress loader
      EasyLoading.dismiss();
    }
    return responseJson;
  }

  ///
  /// This method is used to call api with formdata
  ///
  Future<dynamic> postFormData(String url, http.MultipartFile file,
      {String? filePath,
      bool isLoaderShow = true,
      bool isErrorSnackShow = true}) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      var headers = GetStorage().read(AppPreferencesHelper.pUser) == null
          ? {
              "Content-Type": "application/json",
            }
          : {
              "Content-Type": "application/json",
              "Authorization": UserData.fromJson(
                      GetStorage().read(AppPreferencesHelper.pUser))
                  .token!
            };

      Get.printInfo(info: 'header- ${headers.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');

      ///
      /// Make the post method api call with header and given parameter
      ///
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
      request.files.add(file);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var responseString = await response.stream.bytesToString();
      printInfo(info: responseString);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map = _returnFormDataResponse(
          response.statusCode, json.decode(responseString));

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      CustomWidget.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  /// Check response status and handle exception
  static _response(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {

      /// Successfully get api response
      case 200:
        if (json.decode(response.body)['status'] != 200) {
          throw BadRequestException(
              ErrorModel.fromJson(json.decode(response.body.toString()))
                  .message);
        } else {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }

      /// Successfully get api response
      case 201:
        if (json.decode(response.body)['status'] != 200) {
          throw BadRequestException(
              ErrorModel.fromJson(json.decode(response.body.toString()))
                  .message);
        } else {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }

      /// Bad request need to check url
      case 400:
        throw BadRequestException(
            ErrorModel.fromJson(json.decode(response.body.toString())).message);

      /// Bad request need to check url
      case 401:
        throw BadRequestException(
            ErrorModel.fromJson(json.decode(response.body.toString())).message);

      /// Authorisation token invalid
      case 403:
        throw UnauthorisedException(
            ErrorModel.fromJson(json.decode(response.body.toString())).message);

      /// Authorisation token invalid
      case 417:
        throw UnauthorisedException(
            ErrorModel.fromJson(json.decode(response.body.toString())).message);

      /// Authorisation token invalid
      case 409:
        throw UnauthorisedException(
            ErrorModel.fromJson(json.decode(response.body.toString())).message);

      /// Error occured while Communication with Server
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }

  dynamic _returnFormDataResponse(
      int? statusCode, Map<String, dynamic> response,
      {bool isShow = true}) {
    EasyLoading.dismiss();
    switch (statusCode) {
      case 200:
        var responseJson = response;
        if (responseJson['status'] == false) {
          throw BadRequestException(responseJson['message']);
        }
        return responseJson;
      case 400:
        if (isShow) {
          CustomWidget.errorSnackBar(content: response.toString());
        }
        throw BadRequestException(response.toString());
      case 401:
        if (isShow) {
          CustomWidget.errorSnackBar(content: response.toString());
        }
        GetStorage().erase();
        throw BadRequestException(response.toString());
      case 403:
        CustomWidget.errorSnackBar(
            content: ErrorModel.fromJson(response).message!);
        throw UnauthorisedException(response.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : $statusCode');
    }
  }
}
