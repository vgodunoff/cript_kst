import 'package:json_annotation/json_annotation.dart';

part 'ticker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Tickers {
  @JsonKey(name: 'results')
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

  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;

  @JsonKey(name: 'base_currency_symbol')
  final String baseCurrencySymbol;

  Ticker({
    required this.ticker,
    required this.currencySymbol,
    required this.baseCurrencySymbol,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);
  Map<String, dynamic> toJson() => _$TickerToJson(this);
}
