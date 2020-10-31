import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vicoin/net/quotes_manager.dart';

import 'application.dart';
import 'net/api.dart';
import 'net/intercept.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final List<Interceptor> interceptors = [];
  interceptors.add(LoggingInterceptor());
  interceptors.add(AdapterInterceptor());
  setInitHuobi(
    baseUrl: Api.huobiUrl,
    interceptors: interceptors,
  );

  runApp(createApp());
}
