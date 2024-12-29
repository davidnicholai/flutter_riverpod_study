import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/app/root_app.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: RootApp(),
    ),
  );
}
