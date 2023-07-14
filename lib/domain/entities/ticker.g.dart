// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tickers _$TickersFromJson(Map<String, dynamic> json) => Tickers(
      tickers: (json['results'] as List<dynamic>)
          .map((e) => Ticker.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      requestId: json['request_id'] as String,
      count: json['count'] as int,
      nextUrl: json['next_url'] as String,
    );

Map<String, dynamic> _$TickersToJson(Tickers instance) => <String, dynamic>{
      'results': instance.tickers.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'request_id': instance.requestId,
      'count': instance.count,
      'next_url': instance.nextUrl,
    };

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      ticker: json['ticker'] as String,
      currencySymbol: json['currency_symbol'] as String,
      baseCurrencySymbol: json['base_currency_symbol'] as String,
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'ticker': instance.ticker,
      'currency_symbol': instance.currencySymbol,
      'base_currency_symbol': instance.baseCurrencySymbol,
    };
