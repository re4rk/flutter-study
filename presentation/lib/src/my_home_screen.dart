import 'package:flutter/material.dart';

class Counter {
  int _value = 0;

  int add(int value) {
    _value += value;
    return _value;
  }

  // operator get
  int get value => _value;
  // setter
  set value(int value) => _value = value;
}


class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({super.key, required this.title, required this.counter});

  final String title;
  final Counter counter;

  @override
  State<MyHomeScreen> createState() => MyHomeScreenState(counter: counter);
}

class MyHomeScreenState extends State<MyHomeScreen> {
  MyHomeScreenState({required this.counter});

  final Counter counter;

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
            Text('${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
