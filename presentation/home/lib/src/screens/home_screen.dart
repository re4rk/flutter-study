import 'package:flutter/material.dart';
import 'package:home/home.dart';

import 'daangn_screen.dart';
import '../util/platform_util.dart';
import 'my_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _counter = Counter();

  int _tabIndex = 0;

  late var destinations = <List<dynamic>>[];

  @override
  void initState() {
    super.initState();
    destinations = [
      [
        '나의 판매글',
        Icon(Icons.text_snippet),
      ],
      ['홈', Icon(Icons.home), Container(color: Colors.blue)],
      ['마이페이지', Icon(Icons.people), Container(color: Colors.green)]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    );
  }

  dynamic _buildBody() {
    return switch (_tabIndex) {
      0 => MyHomeScreen(title: 'My Home', counter: _counter),
      1 => DaangnScreen(),
      int() => Container(color: Colors.green),
    };
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: destinations
          .map((it) => BottomNavigationBarItem(icon: it[1], label: it[0]))
          .toList(),
      currentIndex: _tabIndex,
      selectedItemColor: Colors.lightGreen,
      onTap: _onItemTapped,
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter.value += 1;
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  void _onItemTapped(int index) {
    if(index == 2) {
      if(isMobile) {
        context.goTossPayments();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('해당 플랫폼에서는 지원하지 않는 기능입니다.'),
          ),
        );
      }
    } else {
      setState(() {
        _onPageChanged(index);
      });
    }
  }
}
