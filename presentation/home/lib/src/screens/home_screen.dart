import 'package:flutter/material.dart';
import 'package:home/home.dart';

import 'daangn_screen.dart';
import '../util/platform_util.dart';
import 'coinone_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;

  late var destinations = <Map<String, dynamic>>[];

  @override
  void initState() {
    super.initState();
    destinations = [
      {"label": '코인원', "icon": Icon(Icons.add_business)},
      {"label": '홈', "icon": Icon(Icons.home)},
      {"label": '토스 결제', "icon": Icon(Icons.account_balance_outlined)}
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
      0 => CoinoneScreen(title: 'My Home'),
      1 => DaangnScreen(),
      int() => Container(color: Colors.green),
    };
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: destinations
          .map((it) =>
              BottomNavigationBarItem(icon: it["icon"], label: it["label"]))
          .toList(),
      currentIndex: _tabIndex,
      selectedItemColor: Colors.lightGreen,
      onTap: _onItemTapped,
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: (){},
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      if (isMobile) {
        context.goTossPayments();
      } else {
        _showSnackBar('해당 플랫폼에서는 지원하지 않는 기능입니다.');
      }
    } else {
      _onPageChanged(index);
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}
