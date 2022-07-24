import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    final body = '''
{
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'http://devaurigraph.aurigraph.io:9091/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      params: {
        'username': username,
        'password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class PANAuthCall {
  static Future<ApiCallResponse> call({
    String? panNumber = 'ELNPS6784M',
  }) {
    final body = '''
{
  "pan":"${panNumber}"
} ''';
    return ApiManager.instance.makeApiCall(
      callName: 'PANAuth',
      apiUrl: 'https://api.whatsloan.com/v1/ekyc/panAuth',
      callType: ApiCallType.POST,
      headers: {
        'token': 'd6104d34-c55e-4154-85de-15e308ba529b',
      },
      params: {
        'panNumber': panNumber,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic panResponse(dynamic response) => getJsonField(
        response,
        r'''$.result.name''',
      );
}

class GstCall {
  static Future<ApiCallResponse> call({
    String? gstNumber = '',
  }) {
    final body = '''
{
  "gstin": "${gstNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'gst',
      apiUrl: 'https://api.whatsloan.com/v1/ekyc/gst/auth',
      callType: ApiCallType.POST,
      headers: {
        'token': 'd6104d34-c55e-4154-85de-15e308ba529b',
      },
      params: {
        'gstNumber': gstNumber,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class FssaiCall {
  static Future<ApiCallResponse> call({
    int? fssaiRegNum,
  }) {
    final body = '''
{
  "reg_no": "${fssaiRegNum}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fssai',
      apiUrl: 'https://api.whatsloan.com/v1/ekyc/fssai',
      callType: ApiCallType.POST,
      headers: {
        'token': 'd6104d34-c55e-4154-85de-15e308ba529b',
      },
      params: {
        'fssaiRegNum': fssaiRegNum,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AadharOTPCall {
  static Future<ApiCallResponse> call({
    int? aadharNum,
  }) {
    final body = '''
{
  "aadhaarNo": "${aadharNum}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'aadharOTP',
      apiUrl: 'https://api.whatsloan.com/v1/ekyc/aadhaarXmlGetOtp',
      callType: ApiCallType.POST,
      headers: {
        'token': 'd6104d34-c55e-4154-85de-15e308ba529b',
      },
      params: {
        'aadharNum': aadharNum,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AadharDownloadCall {
  static Future<ApiCallResponse> call({
    String? requestID = '',
    int? otp,
  }) {
    final body = '''
{
  "requestId": "${requestID}",
  "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'aadharDownload',
      apiUrl: 'https://api.whatsloan.com/v1/ekyc/aadhaarXmlDownload',
      callType: ApiCallType.POST,
      headers: {
        'token': 'd6104d34-c55e-4154-85de-15e308ba529b',
      },
      params: {
        'requestID': requestID,
        'otp': otp,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UserdetailsCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
    "userName":"johndoe"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userdetails',
      apiUrl: 'http://devaurigraph.aurigraph.io:9091/smartcontract/userDetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
