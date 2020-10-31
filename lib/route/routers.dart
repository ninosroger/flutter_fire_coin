import 'package:fluro/fluro.dart';
import 'package:flutter_vicoin/route/router_handlers.dart';

class Routers {
  static String root = "/";
  static String index = "/index";
  static String login = "/login";
  static String register = "/register";

  static Router configureRoutes() {
    final router = Router();
    router.define(root, handler: splashHandler);
    router.define(index, handler: indexHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    return router;
  }
}
