import 'package:flutter/material.dart';

import 'daangn_screen.dart';
import 'my_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _counter = Counter();
  final controller = PageController(initialPage: 0);

  int _tabIndex = 0;

  late var destinations = <List<dynamic>>[];

  @override
  void initState() {
    super.initState();
    destinations = [
      [
        '나의 판매글',
        Icon(Icons.text_snippet),
        MyHomeScreen(counter: _counter, title: widget.title)
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

  Widget _buildBody() {
    return PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: _onPageChanged,
      children: [
        MyHomeScreen(counter: _counter, title: widget.title),
        DaangnScreen(),
        Container(color: Colors.green),
      ],
    );
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
    setState(() {
      _onPageChanged(index);
      controller.animateToPage(_tabIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }
}
