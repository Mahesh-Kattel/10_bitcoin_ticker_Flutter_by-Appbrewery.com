import 'package:bitcoin/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  CupertinoPicker IosPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      Text(currency);
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          //2: Call getData() when the picker/dropdown changes.
          getData();
          getDataETH();
          getDataLTC();
        });
      },
      children: pickerItems,
    );
  }

  getDropDownItem() {
    List<DropdownMenuItem> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      //for(String currency in currenciesList
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
        onTap: () {
          setState(() {
            selectedCurrency = currency;
          });
        },
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton(
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          //2: Call getData() when the picker/dropdown changes.
          print(selectedCurrency);
          getData();
          getDataETH();
          getDataLTC();
        });
      },
      items: dropDownItems,
    );
  }

  //12. Create a variable to hold the value and use in our Text Widget. Give the variable a starting value of '?' before the data comes back from the async methods.
  String bitcoinValueInUSD = '?';
  String ETHcoinValueInUSD = '?';
  String LTCcoinValueInUSD = "?";
  String currency = 'AUD';
//11. Create an async method here await the coin data from coin_data.dart
  void getData() async {
    try {
      //Have a LOok Over here
      //double data = await CoinData().getCoinData();
      //Yes Here
      double data = await CoinDataSilver(selectCurrency: selectedCurrency)
          .getCoinData(selectedCurrency);
      print('Bitcoin : $data');
      //13. We can't await in a setState(). So you have to separate it out into two steps.
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  void getDataETH() async {
    try {
      //Have a LOok Over here
      //double data = await CoinData().getCoinData();
      //Yes Here
      double data = await CoinDataSilverETH(selectCurrency: selectedCurrency)
          .getCoinData(selectedCurrency);
      print('ETC : $data');
      //13. We can't await in a setState(). So you have to separate it out into two steps.
      setState(() {
        ETHcoinValueInUSD = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  void getDataLTC() async {
    try {
      //Have a LOok Over here
      //double data = await CoinData().getCoinData();
      //Yes Here
      double data = await CoinDataSilverLTC(selectCurrency: selectedCurrency)
          .getCoinData(selectedCurrency);
      print('LTC : $data');
      //13. We can't await in a setState(). So you have to separate it out into two steps.
      setState(() {
        LTCcoinValueInUSD = data.toStringAsFixed(0);
        print('LTC values is: $LTCcoinValueInUSD');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    //14. Call getData() when the screen loads up. We can't call CoinData().getCoinData() directly here because we can't make initState() async.
    getData();
    getDataETH();
    getDataLTC();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  // '1 BTC = ? USD',
                  // textAlign: TextAlign.center,
                  // style: TextStyle(
                  //   fontSize: 20.0,
                  //   color: Colors.white,
                  //15. Update the Text Widget with the data in bitcoinValueInUSD.
                  '1 BTC = $bitcoinValueInUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  // '1 BTC = ? USD',
                  // textAlign: TextAlign.center,
                  // style: TextStyle(
                  //   fontSize: 20.0,
                  //   color: Colors.white,
                  //15. Update the Text Widget with the data in bitcoinValueInUSD.
                  '1 ETH = $ETHcoinValueInUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  // '1 BTC = ? USD',
                  // textAlign: TextAlign.center,
                  // style: TextStyle(
                  //   fontSize: 20.0,
                  //   color: Colors.white,
                  //15. Update the Text Widget with the data in bitcoinValueInUSD.
                  '1 LTC = $LTCcoinValueInUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? IosPicker() : getDropDownItem(),
          ),
        ],
      ),
    );
  }
}
