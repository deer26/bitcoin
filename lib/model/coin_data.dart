import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currentList = [
  'USD',
  'EUR',
  'GBP',
  'TRY',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
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
  'ZAR',

];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '868607E8-8C15-4479-99F7-1A5572719B3A';

class CoinData {
  Future getCoinData(String cryptoData, String currencyData) async {
    String requestUrl = "$coinAPIURL/$cryptoData/$currencyData?apikey=$apiKey";
    http.Response response = await http.get(requestUrl);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData["rate"];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw "Proble with the get request";
    }
  }
}
