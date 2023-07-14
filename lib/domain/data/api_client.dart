import 'dart:convert';
import 'dart:io';
import 'package:cript_kst/domain/cofiguration/configuration.dart';
import 'package:cript_kst/domain/entities/price_cripto.dart';
import 'package:cript_kst/domain/entities/ticker.dart';
import 'package:cript_kst/domain/entities/ticker_with_prices.dart';
import 'package:http/http.dart' as http;

enum ApiClientExeptionType { network, request, other }

class ApiClientExeption implements Exception {
  final ApiClientExeptionType type;

  ApiClientExeption(this.type);
}

class ApiClient {
  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('${Configuration.host}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<T> getData<T>(String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? parameters]) async {
    final url = _makeUri(path, parameters);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        final result = parser(json);
        return result;
      } else if (response.statusCode == 404) {
        throw ApiClientExeption(ApiClientExeptionType.request);
      } else {
        throw ApiClientExeption(ApiClientExeptionType.other);
      }
    } on SocketException {
      throw ApiClientExeption(ApiClientExeptionType.network);
    } on ApiClientExeption {
      rethrow;
    } catch (_) {
      throw ApiClientExeption(ApiClientExeptionType.other);
    }
  }

  Future<List<Ticker>> getTickerList() async {
    List<Ticker> parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = Tickers.fromJson(jsonMap);
      final listTickers = response.tickers;
      return listTickers;
    }

    final result = getData(
      '/v3/reference/tickers',
      parser,
      <String, dynamic>{
        'market': 'crypto',
        'active': true.toString(),
        'apiKey': Configuration.apiKey
      },
    );

    return result;
  }

  Future<List<PriceCripto>> getTickerPrices(String tickerName) async {
    //по дефолту свежих данных не предоставляют, нужна платная подписка
    //берем вчерашние данные и позавчерашние
    final yesterday =
        DateTime.now().millisecondsSinceEpoch - Configuration.dayInMilliseconds;
    final prevDay = yesterday - Configuration.dayInMilliseconds;

    List<PriceCripto> parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final priceCriptoInfo = PriceCriptoInfo.fromJson(jsonMap);
      final prices = priceCriptoInfo.prices;
      return prices;
    }

    final result = getData(
      '/v2/aggs/ticker/$tickerName/range/1/day/$prevDay/$yesterday',
      parser,
      <String, dynamic>{
        'adjusted': true.toString(),
        'sort': 'desc',
        'limit': 100.toString(),
        'apiKey': Configuration.apiKey
      },
    );

    return result;
  }

  Future<TickerWithPrices> getPrices(Ticker ticker) async {
    final listPrices = await getTickerPrices(ticker.ticker);
    //сначала свежие данные, текущие
    final currentOpenPrice = listPrices[0].openPrice;
    final currentClosePrice = listPrices[0].closePrice;
    final currentHighestPrice = listPrices[0].highestPrice;
    final currentLowestPrice = listPrices[0].lowestPrice;

    //затем предыдущие, более старые данные, prev
    final prevClosePrice = listPrices[1].closePrice;

    //разница между текущими и предыдущими данными цены закрытия
    final todaysChange = currentClosePrice - prevClosePrice;
    final todaysChangePerc = currentClosePrice / prevClosePrice;
    return TickerWithPrices(
        ticker: ticker,
        closePrice: currentClosePrice,
        openPrice: currentOpenPrice,
        highestPrice: currentHighestPrice,
        lowestPrice: currentLowestPrice,
        todaysChange: todaysChange,
        todaysChangePerc: todaysChangePerc);
  }
}
