import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sprintf/sprintf.dart';

import '../global_field.dart';
import 'net_error.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    if (options.queryParameters.isEmpty) {
      GlobalField.logger.d('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      GlobalField.logger.d('RequestUrl: ' +
          options.baseUrl +
          options.path +
          '?' +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    GlobalField.logger.d('RequestMethod: ' + options.method);
    GlobalField.logger.d('RequestHeaders:' + options.headers.toString());
    GlobalField.logger.d('RequestContentType: ${options.contentType}');
    GlobalField.logger.d('RequestData: ${options.data.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (response.statusCode == ExceptionHandle.success) {
      GlobalField.logger.d('ResponseCode: ${response.statusCode}');
    }
    GlobalField.logger.d(response.data.toString());
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}

class AdapterInterceptor extends Interceptor {
  static const String _keyFailureFormat = '{\"code\":%d,\"msg\":\"%s\"}';
  static const String _quotesSuccessFormat =
      '{\"code\":%d,\"msg\":\"%s\",\"data\":%s}';
  static const String _keySuccessFormat =
      '{\"code\":%d,\"msg\":\"%s\",\"data\":\"%s\"}';

  @override
  Future onResponse(Response response) {
    final Response r = adapterData(response);
    return super.onResponse(r);
  }

  @override
  Future onError(DioError err) {
    if (err.response != null) {
      adapterData(err.response);
    }
    return super.onError(err);
  }

  Response adapterData(Response response) {
    String result;
    String content = response.data?.toString() ?? '';

    if (response.statusCode == ExceptionHandle.success) {
      if (content.isNotEmpty) {
        if (content[0] == "[") {
          result = sprintf(
              _quotesSuccessFormat, [ExceptionHandle.success, "获取成功", content]);
        } else {
          Map data = json.decode(content);
          if (data["status"].toString() == "ok") {
            result = sprintf(_keySuccessFormat,
                [response.statusCode, data["ts"], data["data"]]);
          } else if (data["status"].toString() == "error") {
            result = sprintf(_keyFailureFormat, [
              ExceptionHandle.huobi_data_error,
              "${data['err-code']} : ${data['err-msg']}"
            ]);
          } else if (data["code"] == ExceptionHandle.success) {
            result = content;
          } else {
            result = sprintf(_keyFailureFormat, [data["code"], data["msg"]]);
          }
        }
      }
    } else {
      try {
        if (content.isNotEmpty) {
          Map data = json.decode(content);
          if (data["status"].toString() == "error") {
            result = sprintf(_keyFailureFormat, [
              ExceptionHandle.huobi_data_error,
              "${data['err-code']} : ${data['err-msg']}"
            ]);
          } else {
            result = sprintf(_keyFailureFormat, [data["code"], data["msg"]]);
          }
        }
      } catch (e) {
        GlobalField.logger.d('异常信息：$e');
        result = sprintf(_keyFailureFormat, [response.statusCode, '异常信息：($e)']);
      }
    }
    response.statusCode = ExceptionHandle.success;
    response.data = result;
    return response;
  }
}
