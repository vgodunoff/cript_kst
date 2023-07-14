import 'package:cript_kst/domain/data/api_client.dart';
import 'package:cript_kst/domain/entities/ticker.dart';
import 'package:cript_kst/domain/entities/ticker_with_prices.dart';

class Repository {
  final _apiClient = ApiClient();
  final _tickers = <Ticker>[];
  final _tickerWithPrices = <TickerWithPrices>[];
  List<TickerWithPrices> get gettickerWithPrices => _tickerWithPrices;
  Repository() {
    _asyncInit();
  }

  Future<void> _asyncInit() async {
    final tickers = await _apiClient.getTickerList();
    _tickers.addAll(tickers);
  }

  Future<void> addTickerWithPrices() async {
    for (var ticker in _tickers) {
      final tickerPrices = await _apiClient.getPrices(ticker);
      _tickerWithPrices.add(tickerPrices);
    }
  }
}
