import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/src/screens/my_home_screen.dart';
import 'package:tosspayments/tosspayments.dart';

import 'screens/daangn_screen.dart';
import 'screens/home_screen.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen(
          title: '',
        );
      },
      routes: [
        GoRoute(
          path: 'daangn',
          builder: (context, state) {
            return DaangnScreen();
          },
        ),
        GoRoute(
          path: 'toss_payments',
          builder: (context, state) {
            return  TosspaymentsSampleHome(title: "Hello");
          },
        ),
      ],
    ),
  ],
);
