import 'package:json_annotation/json_annotation.dart';

part 'price_cripto.g.dart';

@JsonSerializable(explicitToJson: true)
class PriceCriptoInfo {
  String ticker;
  int queryCount;
  int resultsCount;
  bool adjusted;
  List<PriceCripto> prices;
  String status;
  String requestId;
  int count;

  PriceCriptoInfo({
    required this.ticker,
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.prices,
    required this.status,
    required this.requestId,
    required this.count,
  });

  factory PriceCriptoInfo.fromJson(Map<String, dynamic> json) =>
      _$PriceCriptoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceCriptoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PriceCripto {
  @JsonKey(name: 'v')
  double volumeTrade;

  @JsonKey(name: 'vm')
  double volumeWeightAvrPrice;

  @JsonKey(name: 'o')
  double openPrice;

  @JsonKey(name: 'c')
  double closePrice;

  @JsonKey(name: 'h')
  double highestPrice;

  @JsonKey(name: 'l')
  double lowestPrice;

  @JsonKey(name: 't')
  int dateInMsec;

  @JsonKey(name: 'n')
  int numberTransactions;

  PriceCripto({
    required this.volumeTrade,
    required this.volumeWeightAvrPrice,
    required this.openPrice,
    required this.closePrice,
    required this.highestPrice,
    required this.lowestPrice,
    required this.dateInMsec,
    required this.numberTransactions,
  });

  factory PriceCripto.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
