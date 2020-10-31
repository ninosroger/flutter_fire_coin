import 'package:flutter_vicoin/entity/token_entity.dart';

tokenEntityFromJson(TokenEntity data, Map<String, dynamic> json) {
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	return data;
}

Map<String, dynamic> tokenEntityToJson(TokenEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['token'] = entity.token;
	return data;
}