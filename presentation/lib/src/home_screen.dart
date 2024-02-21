import 'package:flutter/material.dart';
import 'package:presentation/src/my_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _counter = Counter();
  static const initialPage = 1;
  final controller = PageController(initialPage: initialPage);

  int get tabIndex => controller.hasClients
      ? controller.page?.toInt() ?? initialPage
      : initialPage;

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

  void _incrementCounter() {
    setState(() {
      _counter.value += 1;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      controller.jumpToPage(index);
    });
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
      children: [
        MyHomeScreen(counter: _counter, title: widget.title),
        Container(color: Colors.blue),
        Container(color: Colors.green),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: destinations
          .map((it) => BottomNavigationBarItem(icon: it[1], label: it[0]))
          .toList(),
      currentIndex: tabIndex,
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
}
