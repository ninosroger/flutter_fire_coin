import 'package:flutter_vicoin/entity/quotes_entity.dart';

quotesEntityFromJson(QuotesEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['symbol'] != null) {
		data.symbol = json['symbol']?.toString();
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toInt();
	}
	if (json['logo'] != null) {
		data.logo = json['logo']?.toString();
	}
	if (json['logo_png'] != null) {
		data.logoPng = json['logo_png']?.toString();
	}
	if (json['price_usd'] != null) {
		data.priceUsd = json['price_usd']?.toDouble();
	}
	if (json['price_btc'] != null) {
		data.priceBtc = json['price_btc']?.toDouble();
	}
	if (json['volume_24h_usd'] != null) {
		data.volume24hUsd = json['volume_24h_usd']?.toDouble();
	}
	if (json['market_cap_usd'] != null) {
		data.marketCapUsd = json['market_cap_usd']?.toDouble();
	}
	if (json['available_supply'] != null) {
		data.availableSupply = json['available_supply']?.toDouble();
	}
	if (json['total_supply'] != null) {
		data.totalSupply = json['total_supply']?.toDouble();
	}
	if (json['max_supply'] != null) {
		data.maxSupply = json['max_supply']?.toDouble();
	}
	if (json['percent_change_1h'] != null) {
		data.percentChange1h = json['percent_change_1h']?.toDouble();
	}
	if (json['percent_change_24h'] != null) {
		data.percentChange24h = json['percent_change_24h']?.toDouble();
	}
	if (json['percent_change_7d'] != null) {
		data.percentChange7d = json['percent_change_7d']?.toDouble();
	}
	if (json['last_updated'] != null) {
		data.lastUpdated = json['last_updated']?.toInt();
	}
	if (json['volume_24h_cny'] != null) {
		data.volume24hCny = json['volume_24h_cny']?.toDouble();
	}
	if (json['market_cap_cny'] != null) {
		data.marketCapCny = json['market_cap_cny']?.toDouble();
	}
	if (json['price_cny'] != null) {
		data.priceCny = json['price_cny']?.toDouble();
	}
	return data;
}

Map<String, dynamic> quotesEntityToJson(QuotesEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['symbol'] = entity.symbol;
	data['rank'] = entity.rank;
	data['logo'] = entity.logo;
	data['logo_png'] = entity.logoPng;
	data['price_usd'] = entity.priceUsd;
	data['price_btc'] = entity.priceBtc;
	data['volume_24h_usd'] = entity.volume24hUsd;
	data['market_cap_usd'] = entity.marketCapUsd;
	data['available_supply'] = entity.availableSupply;
	data['total_supply'] = entity.totalSupply;
	data['max_supply'] = entity.maxSupply;
	data['percent_change_1h'] = entity.percentChange1h;
	data['percent_change_24h'] = entity.percentChange24h;
	data['percent_change_7d'] = entity.percentChange7d;
	data['last_updated'] = entity.lastUpdated;
	data['volume_24h_cny'] = entity.volume24hCny;
	data['market_cap_cny'] = entity.marketCapCny;
	data['price_cny'] = entity.priceCny;
	return data;
}