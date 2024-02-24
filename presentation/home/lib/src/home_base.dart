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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

const String _ROOT = '/';
const String _TOSS_PAYMENTS = 'toss_payments';

extension HomeRoutes on BuildContext {
  void goTossPayments() => go(_ROOT + _TOSS_PAYMENTS);
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: _ROOT,
      builder: (context, state) => const HomeScreen(title: 'My Home'),
      routes: [
        GoRoute(
          path: _TOSS_PAYMENTS,
          builder: (context, state) => TosspaymentsSampleHome(title: "Hello"),
        ),
      ],
    ),
  ],
);
