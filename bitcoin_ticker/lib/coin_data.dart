import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'F2DC899A-FBAE-43CF-94E6-884033CE60C8';
const urlHead = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String? convertTo) async {
    Map<String, String> cryptoPrice = {};
    for (String element in cryptoList) {
      var urlParsed = Uri.parse('$urlHead/$element/$convertTo?apikey=$apiKey');
      http.Response response = await http.get(urlParsed);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        double rate = jsonResponse['rate'];
        cryptoPrice[element] = rate.toStringAsFixed(0);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw 'Problem with the get request';
      }
    }
    return cryptoPrice;
  }
}
