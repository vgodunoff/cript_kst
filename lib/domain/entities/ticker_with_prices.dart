import 'package:cript_kst/domain/entities/ticker.dart';

class TickerWithPrices {
  Ticker ticker;
  final double openPrice;
  final double closePrice;
  final double highestPrice;
  final double lowestPrice;
  final double todaysChange;
  final double todaysChangePerc;

  TickerWithPrices(
      {required this.ticker,
      required this.openPrice,
      required this.closePrice,
      required this.highestPrice,
      required this.lowestPrice,
      required this.todaysChange,
      required this.todaysChangePerc});
}
