import 'dart:convert';

import 'package:flutter_vicoin/global_field.dart';

bool hasLogin() => GlobalField.prefs.getString(GlobalField.token) != null;

signOut() {
  GlobalField.prefs.remove(GlobalField.token);
  GlobalField.prefs.remove(GlobalField.account);
  GlobalField.prefs.remove(GlobalField.userInfo);
}

String getToken() => GlobalField.prefs.getString(GlobalField.token) ?? "";

String getAccount() =>
    GlobalField.prefs.getString(GlobalField.account) ?? "点击登录";

String getInvite() => json.decode(GlobalField.prefs
            .getString(GlobalField.userInfo) ??
        '{"cis":"0.0000","me":0,"team":0,"invite":"欢迎来到Huobi","invite_link":""}')[
    "invite"];
