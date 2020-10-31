import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_vicoin/entity/root_data.dart';

import '../global_field.dart';
import 'net_error.dart';

int _connectTimeout = 30000;
int _receiveTimeout = 30000;
int _sendTimeout = 20000;
String _baseUrl;
List<Interceptor> _interceptors = [];

void setInitHuobi({
  int connectTimeout,
  int receiveTimeout,
  int sendTimeout,
  String baseUrl,
  List<Interceptor> interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

typedef NetSuccessCallback<T> = Function(T data);
typedef NetSuccessListCallback<T> = Function(List<T> data);
typedef NetErrorCallback = Function(int code, String msg);

class QuotesNet {
  static final QuotesNet _singleton = QuotesNet._();

  static QuotesNet get instance => QuotesNet();

  factory QuotesNet() => _singleton;

  static Dio _dio;

  Dio get dio => _dio;

  QuotesNet._() {
    final BaseOptions _options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      responseType: ResponseType.plain,
      validateStatus: (_) {
        return true;
      },
      baseUrl: _baseUrl,
    );
    _dio = Dio(_options);

    _interceptors.forEach((interceptor) {
      _dio.interceptors.add(interceptor);
    });
  }

  Future<RootData<T>> _request<T>(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) async {
    final Response<String> response = await _dio.request<String>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    final String resp = response.data.toString();
    Map map = json.decode(resp);
    try {
      final bool isCompute = resp.length > 10 * 1024;
      final Map<String, dynamic> _map =
          isCompute ? await compute(parseData, resp) : parseData(resp);
      return RootData<T>.fromJson(_map);
    } catch (e) {
      debugPrint(e.toString());
      return (map["code"] == ExceptionHandle.success)
          ? RootData<T>(ExceptionHandle.parse_error, '数据解析错误！', null)
          : RootData<T>(map["code"], map["msg"], null);
    }
  }

  Options _checkOptions(String method, Options options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  Future requestNetwork<T>(
    Method method,
    String url, {
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) {
    return _request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ).then<void>((RootData<T> result) {
      if (result.code == ExceptionHandle.success) {
        if (onSuccess != null) {
          onSuccess(result.data);
        }
      } else {
        _onError(result.code, result.msg, onError);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  void asyncRequestNetwork<T>(
    Method method,
    String url, {
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) {
    Stream.fromFuture(_request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    )).asBroadcastStream().listen((result) {
      if (result.code == ExceptionHandle.success) {
        if (onSuccess != null) {
          onSuccess(result.data);
        }
      } else {
        _onError(result.code, result.msg, onError);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  void _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      GlobalField.logger.d('取消请求接口： $url');
    }
  }

  void _onError(int code, String msg, NetErrorCallback onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = '未知异常';
    }
    GlobalField.logger.d('接口请求异常： code: $code, msg: $msg');
    if (onError != null) {
      onError(code, msg);
    }
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { GET, POST, PUT, PATCH, DELETE, HEAD }

extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
