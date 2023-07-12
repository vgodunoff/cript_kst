// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tickers _$TickersFromJson(Map<String, dynamic> json) => Tickers(
      tickers: (json['tickers'] as List<dynamic>)
          .map((e) => Ticker.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      requestId: json['request_id'] as String,
      count: json['count'] as int,
      nextUrl: json['next_url'] as String,
    );

Map<String, dynamic> _$TickersToJson(Tickers instance) => <String, dynamic>{
      'tickers': instance.tickers.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'request_id': instance.requestId,
      'count': instance.count,
      'next_url': instance.nextUrl,
    };

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      ticker: json['ticker'] as String,
      name: json['name'] as String,
      market: json['market'] as String,
      locale: json['locale'] as String,
      active: json['active'] as bool,
      currencySymbol: json['currency_symbol'] as String,
      currencyName: json['currency_name'] as String,
      baseCurrencySymbol: json['base_currency_symbol'] as String,
      baseCurrencyName: json['base_currency_name'] as String,
      lastUpdatedUtc: json['last_updated_utc'] as String,
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'ticker': instance.ticker,
      'name': instance.name,
      'market': instance.market,
      'locale': instance.locale,
      'active': instance.active,
      'currency_symbol': instance.currencySymbol,
      'currency_name': instance.currencyName,
      'base_currency_symbol': instance.baseCurrencySymbol,
      'base_currency_name': instance.baseCurrencyName,
      'last_updated_utc': instance.lastUpdatedUtc,
    };
