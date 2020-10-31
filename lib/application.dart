import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vicoin/route/routers.dart';
import 'package:flutter_vicoin/util/event_bus.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'global_field.dart';

Widget createApp() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  initGlobalField();

  return MaterialApp(
    title: "",
    debugShowCheckedModeBanner: false,
    builder: (context, child) {
      // 保证文字大小不受手机系统设置影响
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child,
      );
    },
    onGenerateRoute: GlobalField.router.generator,
  );
}

void initGlobalField() async {
  GlobalField.router = Routers.configureRoutes();
  GlobalField.logger =
      Logger(printer: PrettyPrinter(printTime: true, colors: true));
  GlobalField.database = openDatabase(
    join(await getDatabasesPath(), 'coin_quotes.db'),
    version: 1,
    onCreate: (db, version) {
      db.execute(GlobalField.createQuotesTable);
      return db;
    },
  );
  GlobalField.prefs = await SharedPreferences.getInstance();
  GlobalField.bus = EventBus();
}
