import 'package:flutter_vicoin/generated/json/base/json_convert_content.dart';
import 'package:flutter_vicoin/generated/json/base/json_field.dart';

class QuotesEntity with JsonConvert<QuotesEntity> {
	String id;
	String name;
	String symbol;
	int rank;
	String logo;
	@JSONField(name: "logo_png")
	String logoPng;
	@JSONField(name: "price_usd")
	double priceUsd;
	@JSONField(name: "price_btc")
	double priceBtc;
	@JSONField(name: "volume_24h_usd")
	double volume24hUsd;
	@JSONField(name: "market_cap_usd")
	double marketCapUsd;
	@JSONField(name: "available_supply")
	double availableSupply;
	@JSONField(name: "total_supply")
	double totalSupply;
	@JSONField(name: "max_supply")
	double maxSupply;
	@JSONField(name: "percent_change_1h")
	double percentChange1h;
	@JSONField(name: "percent_change_24h")
	double percentChange24h;
	@JSONField(name: "percent_change_7d")
	double percentChange7d;
	@JSONField(name: "last_updated")
	int lastUpdated;
	@JSONField(name: "volume_24h_cny")
	double volume24hCny;
	@JSONField(name: "market_cap_cny")
	double marketCapCny;
	@JSONField(name: "price_cny")
	double priceCny;
}
