import 'package:flutter_vicoin/generated/json/base/json_convert_content.dart';

class RootData<T> {
  int code;
  String msg;
  T data;

  RootData(this.code, this.msg, this.data);

  RootData.fromJson(Map<String, dynamic> json) {
    code = json["code"] as int;
    msg = json["msg"] as String;
    data = _generateOBJ<T>(json["data"]);
  }

  T _generateOBJ<T>(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }
}
