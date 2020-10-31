import 'package:fluro/fluro.dart';
import 'package:flutter_vicoin/page/index/page.dart';
import 'package:flutter_vicoin/page/login/page.dart';
import 'package:flutter_vicoin/page/register/page.dart';
import 'package:flutter_vicoin/page/splash/page.dart';

var splashHandler = Handler(handlerFunc: (context, parameters) {
  return SplashPage().buildPage(parameters);
});

var indexHandler = Handler(handlerFunc: (context, parameters) {
  return IndexPage().buildPage(parameters);
});

var loginHandler = Handler(handlerFunc: (context, parameters) {
  return LoginPage().buildPage(parameters);
});

var registerHandler = Handler(handlerFunc: (context, parameters) {
  return RegisterPage().buildPage(parameters);
});
