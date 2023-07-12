// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_cripto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceCripto _$PriceCriptoFromJson(Map<String, dynamic> json) => PriceCripto(
      ticker: json['ticker'] as String,
      queryCount: json['queryCount'] as int,
      resultsCount: json['resultsCount'] as int,
      adjusted: json['adjusted'] as bool,
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      requestId: json['requestId'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$PriceCriptoToJson(PriceCripto instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'queryCount': instance.queryCount,
      'resultsCount': instance.resultsCount,
      'adjusted': instance.adjusted,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'requestId': instance.requestId,
      'count': instance.count,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      volumeTrade: (json['v'] as num).toDouble(),
      volumeWeightAvrPrice: (json['vm'] as num).toDouble(),
      openPrice: (json['o'] as num).toDouble(),
      closePrice: (json['c'] as num).toDouble(),
      highestPrice: json['h'] as int,
      lowestPrice: (json['l'] as num).toDouble(),
      dateInMsec: json['t'] as int,
      numberTransactions: json['n'] as int,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'v': instance.volumeTrade,
      'vm': instance.volumeWeightAvrPrice,
      'o': instance.openPrice,
      'c': instance.closePrice,
      'h': instance.highestPrice,
      'l': instance.lowestPrice,
      't': instance.dateInMsec,
      'n': instance.numberTransactions,
    };
