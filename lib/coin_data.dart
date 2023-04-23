//2. Import the required packages.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'price_screen.dart';

PriceScreen priceScreen = PriceScreen();
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

// This CoinData is just to find BTC Rate in USD only.
// const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = 'BA7B7C46-2613-46B0-AA38-53CE358E925E';
//
// class CoinData {
//   //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
//   Future getCoinData() async {
//     //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
//     String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
//     //5. Make a GET request to the URL and wait for the response.
//     //var url = Uri.https(requestURL);
//     var url = Uri.parse(requestURL);
//     http.Response response = await http.get(url);
//
//     //6. Check that the request was successful.
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
//       var decodedData = jsonDecode(response.body);
//       //8. Get the last price of bitcoin with the key 'last'.
//       var lastPrice = decodedData['rate'];
//       //9. Output the lastPrice from the method.
//       return lastPrice;
//       print(lastPrice);
//     } else {
//       //10. Handle any errors that occur during the request.
//       print(response.statusCode);
//       print(response.body);
//       //Optional: throw an error if our request fails.
//       throw 'Problem with the get request';
//     }
//   }
// }

//......................................................................................................................

//This CoinData Silver is to find BTC rate in Selected Currency
const bitcoinAverageURL =
    'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC&tsyms=USD#';

class CoinDataSilver {
  String selectCurrency = 'AUD';
  CoinDataSilver({required this.selectCurrency});
  //3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(String selectedCurrency) async {
    //4: Update the URL to use the selectedCurrency input.
    String requestURL =
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC&tsyms=$selectedCurrency#';
    var url = Uri.parse(requestURL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //I think problem here
      print(response.body);
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['BTC']['$selectedCurrency'];
      print('$lastPrice is last price');
      return lastPrice;

      print(lastPrice);
      return lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      print(response.body);
      throw 'Problem with the get request';
    }
  }
}

//......................................................................................................................
//this is to find ETH value in different Currency
class CoinDataSilverETH {
  String selectCurrency = 'USD';
  CoinDataSilverETH({required this.selectCurrency});
  //3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(String selectedCurrency) async {
    //4: Update the URL to use the selectedCurrency input.
    String requestURL =
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=ETH&tsyms=$selectedCurrency#';
    var url = Uri.parse(requestURL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //I think problem here
      print(response.body);
      var decodedData = jsonDecode(response.body);
      var ETHlastPrice = decodedData['ETH']['$selectedCurrency'];
      print('$ETHlastPrice is last price');
      return ETHlastPrice;
    } else {
      print(response.statusCode);
      print(response.body);
      throw 'Problem with the get request';
    }
  }
}

//......................................................................................................................
//THis is to find LTC value in different Currency
class CoinDataSilverLTC {
  String selectCurrency = 'AUD';
  CoinDataSilverLTC({required this.selectCurrency});
  //3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(String selectedCurrency) async {
    //4: Update the URL to use the selectedCurrency input.
    String requestURL =
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=LTC&tsyms=$selectedCurrency#';
    var url = Uri.parse(requestURL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //I think problem here
      print(response.body);
      var decodedData = jsonDecode(response.body);
      var LTClastPrice = decodedData['LTC']['$selectedCurrency'];
      print('$LTClastPrice is last price');
      return LTClastPrice;
    } else {
      print(response.statusCode);
      print(response.body);
      throw 'Problem with the get request';
    }
  }
}
