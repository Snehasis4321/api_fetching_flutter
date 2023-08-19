import 'package:api_fetching_flutter/bitcoin_page.dart';
import 'package:api_fetching_flutter/dog_info.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  final tabs = [DogInfoPage(), BitcoinPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.bolt), label: "Future Builder"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dynamic_form), label: "Stream Builder"),
        ],
        currentIndex: _index,
        onTap: (value) => {setState(() => _index = value)},
      ),
    );
  }
}
