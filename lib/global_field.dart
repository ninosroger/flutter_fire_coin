import 'package:fluro/fluro.dart';
import 'package:flutter_vicoin/util/event_bus.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class GlobalField {
  static Router router;
  static Logger logger;
  static Future<Database> database;
  static SharedPreferences prefs;
  static EventBus bus;

  static String quotesTable = "quotes";
  static String token = "token";
  static String userInfo = "user_info";
  static String account = "account";
  static String bannerText = "banner_text";
  static String dropQuotesTable = "DROP TABLE quotes";
  static String createQuotesTable =
      "CREATE TABLE quotes(id TEXT, name TEXT, symbol TEXT, rank INTEGER, logo TEXT, logo_png TEXT, price_usd REAL, price_btc REAL, volume_24h_usd REAL, market_cap_usd REAL, available_supply REAL, total_supply REAL, max_supply REAL, percent_change_1h REAL, percent_change_24h REAL, percent_change_7d REAL, last_updated INTEGER, volume_24h_cny REAL, market_cap_cny REAL, price_cny REAL)";
}
