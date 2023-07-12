import 'package:json_annotation/json_annotation.dart';

part 'ticker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Tickers {
  final List<Ticker> tickers;
  final String status;
  @JsonKey(name: 'request_id')
  final String requestId;
  final int count;
  @JsonKey(name: 'next_url')
  final String nextUrl;
  Tickers({
    required this.tickers,
    required this.status,
    required this.requestId,
    required this.count,
    required this.nextUrl,
  });
  factory Tickers.fromJson(Map<String, dynamic> json) =>
      _$TickersFromJson(json);
  Map<String, dynamic> toJson() => _$TickersToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Ticker {
  final String ticker;
  final String name;
  final String market;
  final String locale;
  final bool active;
  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;

  @JsonKey(name: 'currency_name')
  final String currencyName;

  @JsonKey(name: 'base_currency_symbol')
  final String baseCurrencySymbol;

  @JsonKey(name: 'base_currency_name')
  final String baseCurrencyName;

  @JsonKey(name: 'last_updated_utc')
  final String lastUpdatedUtc;
  Ticker({
    required this.ticker,
    required this.name,
    required this.market,
    required this.locale,
    required this.active,
    required this.currencySymbol,
    required this.currencyName,
    required this.baseCurrencySymbol,
    required this.baseCurrencyName,
    required this.lastUpdatedUtc,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);
  Map<String, dynamic> toJson() => _$TickerToJson(this);
}
