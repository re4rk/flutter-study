import 'package:flutter/material.dart';

class CoinoneScreen extends StatefulWidget {
  CoinoneScreen({super.key, required this.title});

  final String title;

  @override
  State<CoinoneScreen> createState() => CoinoneScreenState();
}

class CoinoneScreenState extends State<CoinoneScreen> {
  CoinoneScreenState();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      color: Colors.black12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text("", style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
