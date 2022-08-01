import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

CoinData data = CoinData();

class PriceScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'AUD';
  Map cryptoValue = {};

  bool isWaiting = false;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> getDropdownItems = [];
    for (String element in currenciesList) {
      getDropdownItems.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getValue();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> getDropdownItems = [];
    for (String element in currenciesList) {
      getDropdownItems.add(
        Center(
          child: Text(element),
        ),
      );
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        print(index);
      },
      children: getDropdownItems,
    );
  }

  Future<void> getValue() async {
    isWaiting = true;
    try {
      Map value = await data.getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        cryptoValue = value;
      });
    } catch (e) {
      print(e);
    }
  }

  List<Widget> cryptoContainer() {
    List<Widget> container = [];
    for (String element in cryptoList) {
      var value = isWaiting ? '?' : cryptoValue[element];
      container.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 $element = $value $selectedCurrency',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return container;
  }

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('🤑 Coin Ticker'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoContainer(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
