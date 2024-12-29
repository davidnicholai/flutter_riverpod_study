import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kratos/app/app_startup_widget.dart';
import 'package:kratos/features/shop/presentation/product_list_page.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kratos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return AppStartupWidget(onLoaded: (_) => child!);
      },
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: <GoRoute>[
          GoRoute(
            path: '/',
            builder: (_, __) => ProductListPage(),
          ),
        ],
      ),
    );
  }
}
